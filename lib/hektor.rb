require "dotenv"
require "curb"

class ApiHektor

  def initialize
  end

  def renouveller_image
    csrftoken = Curl.get(ENV['HOST_HEKTOR'] + ENV['PATH_FORMULAIRE_HEKTOR']).head.scan(/csrftoken=(\w+);/).flatten.first

    Curl.post("https://api.hektor.ca/image_processor/style-transfer", data: {} ) # TODO
  end

end

