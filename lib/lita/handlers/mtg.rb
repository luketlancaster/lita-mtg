require 'mtg_sdk'
require 'pry'

module Lita
  module Handlers
    class Mtg < Handler
      # insert handler code here
      attr_accessor :card

      route(/mtg\s+(.*)?/i, :go_get_card, command: true, help: {
        'mtg me' => 'asks for a card'
      })



      def go_get_card(req)
        puts "Searching for #{req.match_data[1]}"
        cards = MTG::Card.where(name: "#{req.match_data[1]}").all
        if cards.empty?
            return req.reply "Nothing found, please try again"
        end

        for card in cards
            if card_good?(card)
                @card = card
                break
            end
        end

        image = @card.image_url
        req.reply image
      end


      def card_good?(card)
        return true if card.image_url
        false
      end

      Lita.register_handler(self)
    end
  end
end
