require "dotenv"
require "arlo"
require "curb"

class ApiArlo

  def initialize
    Dotenv.load "../.env"
    @api = Arlo::API.new
    exit "mauvaise config Arlo" if not @api
  end

  def get_dernieres_images
    get_cameras.each {|c| download_derniere_image(c)}
  end

private

  def download_derniere_image (camera)
    File.open("images/last_" + camera['deviceName'], 'w') { |f| f.write(Curl.get(camera['presignedLastImageUrl']).body) }
  end

  def get_cameras
    @cameras = @api.devices['data'].select {|d| d['deviceType'] == 'camera'} if not @cameras
    @cameras
  end

end

