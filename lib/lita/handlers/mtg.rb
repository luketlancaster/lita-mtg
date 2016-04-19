require 'mtg_sdk'

module Lita
  module Handlers
    class Mtg < Handler
      # insert handler code here
      attr_accessor :card

      route(/mtg\s+(.*)?/i, :go_get_card, command: true, help: {
        'mtg' => 'asks for a card by name, use double quotes if the incorrect card shows up'
      })



      def go_get_card(req)
        puts "Searching for #{req.match_data[1]}"
        cards = MTG::Card.where(name: "#{req.match_data[1]}").all
        if cards.empty?
            return req.reply "Couldn't find \"#{req.match_data[1]}\", please try again"
        end

        for card in cards
            if card_good?(card)
                @card = card
                break
            end
        end

        image = @card.image_url

        if @card.layout == "double-faced"
            back = card_back(@card)
            image_two = back.image_url
        end

        if image_two
            resp = "#{image}\n#{image_two}"
        else
            resp = image
        end

        req.reply resp
      end


      def card_good?(card)
        return true if card.image_url
        false
      end

      def card_back(card)
          multiverse_id = card.multiverse_id

          if card.number[-1, 1] == "a"
              multiverse_id += 1
          else
              multiverse_id -= 1
          end

          return MTG::Card.find(multiverse_id)

      end

      Lita.register_handler(self)
    end
  end
end
