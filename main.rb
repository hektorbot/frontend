require "dotenv/load"
require "sinatra"
require "arlo"
require "curb"

### Fonctions ###
def get_last_image_cam(cam)
	File.open("images/last_" + cam['deviceName'], 'w') { |f| f.write(Curl.get(cam['presignedLastImageUrl']).body) }
end

### SETUP ###
if ENV['ARLO_EMAIL'] && ENV['ARLO_PASSWORD']
	api = Arlo::API.new
	cameras = api.devices['data'].select {|d| d['deviceType'] == 'camera'}
	get_last_image_cam cameras.last
	#p cameras
else 
	p "Configuration manquante"
	exit
end


### Serveur http expose client
get "/" do
  erb :index
end

