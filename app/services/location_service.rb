include Geokit::Geocoders

class LocationService
  def self.geo(address)
    geo = Geokit::Geocoders::MultiGeocoder.geocode(address)
    geo.success ? geo.all : nil
  end
end
