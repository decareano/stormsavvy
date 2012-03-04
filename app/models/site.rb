class Site < ActiveRecord::Base

  attr_accessible :name, :description, :costcode, :size, :address_1, :address_2, :state, :zipcode, :city, :exposed_area
  belongs_to :project
  geocoded_by :address, :latitude => :lat, :longitude => :long
  after_validation :geocode

  validates_presence_of :name 

  def self.latlong(zipcode)
    l = self.where(:zipcode => zipcode).first
    [] << l.lat << l.long
  end

  def address
    "#{self.address_1} #{self.address_2} #{self.city} #{self.state} #{self.zipcode}".strip
  end
  
  def self.get_24_pop

    hydra = Typhoeus::Hydra.new

    self.all.each do |s|
      latlng = "#{s.lat}%2C#{s.long}"
      begin_time = (Time.now + 22.hours).xmlschema
      end_time = (Time.now + 26.hours).xmlschema
      url = "http://graphical.weather.gov/xml/SOAP_server/ndfdXMLclient.php?whichClient=GmlLatLonList&lat=&lon=&listLatLon=&lat1=&lon1=&lat2=&lon2=&resolutionSub=&listLat1=&listLon1=&listLat2=&listLon2=&resolutionList=&endPoint1Lat=&endPoint1Lon=&endPoint2Lat=&endPoint2Lon=&listEndPoint1Lat=&listEndPoint1Lon=&listEndPoint2Lat=&listEndPoint2Lon=&zipCodeList=&listZipCodeList=&centerPointLat=&centerPointLon=&distanceLat=&distanceLon=&resolutionSquare=&listCenterPointLat=&listCenterPointLon=&listDistanceLat=&listDistanceLon=&listResolutionSquare=&citiesLevel=&listCitiesLevel=&sector=&gmlListLatLon=#{latlng}&featureType=Forecast_Gml2Point&requestedTime=&startTime=&endTime=&compType=&propertyName=&product=time-series&begin=#{begin_time}&end=#{end_time}&Unit=e&pop12=pop12&Submit=Submit"

      request = Typhoeus::Request.new(url)
      hydra.queue(request)

      request.on_complete do |response|
        xml = response.body
        noko = Nokogiri::XML(xml)
        pop24 = noko.xpath("//app:probOfPrecip12hourly").text
        puts "change of rain at site #{s.name} - #{pop24}"
      end
    end

    # run all queued processes
    puts "Sending requests to noaa"
    hydra.run

  end
end
