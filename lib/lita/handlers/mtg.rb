require 'mtg_sdk'

module Lita
  module Handlers
    class Mtg < Handler
      # insert handler code here
      route(/mtg(?: me)?/i, :handle_trivia_request, command: true, help: {
        'trivia me' => 'asks for a question from the trivia API'
      })

      def handle_trivia_request(req)
        print "Here is a thing\n"
      end

      Lita.register_handler(self)
    end
  end
end
