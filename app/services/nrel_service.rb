class NrelService

  def initialize
    @connection = Faraday.new(url: "https://developer.nrel.gov/")
    # @connecton.headers[:Authorization] = api_key, ENV["nrel_api_key"]
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def stations_hash
    zip = 80203
    parse(@connection.get "api/alt-fuel-stations/v1.json?api_key=#{ENV['nrel_api_key']}&fuel_type=LPG,ELEC&zip=#{zip}&limit=10")
  end

  def stations
    stations_hash[:fuel_stations].each do |station|
      staion[0][:name]
    end
  end

end
