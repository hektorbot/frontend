require "thread"
require "sinatra"

require_relative "lib/arlo.rb"

### Refraichir les images des cameras ###
api_arlo = ApiArlo.new
Thread.new do
  loop do
    api_arlo.get_dernieres_images
    sleep 60
  end
end

### Serveur http expose client
#get "/" do
#  erb :index
#end
