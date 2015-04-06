require 'httparty'
require 'json'

module Lita
  module Handlers
    class Hopcat < Handler
      URL = "http://hopcat-api.herokuapp.com/drafts"

      route(/hopcat(?: me)?/i, :hopcat, command: true, help: {
        "hopcat" => "display what's on tap at HopCat Broad Ripple",
        "hopcat me" => "display what's on tap at HopCat Broad Ripple"
      })

      def hopcat(response)
        http_response = HTTParty.get URL
        data = JSON.parse(http_response.body)
        mesg = "Current HopCat Drafts:\n\n"
        data['drafts'].each do |beer|
          mesg << beer['title'] + "\n"
          mesg << beer['brewery'] + "\n"
          mesg << beer['location'] + "\n"
          mesg << "\n"
        end
        response.reply mesg
      end
    end

    Lita.register_handler(Hopcat)
  end
end
