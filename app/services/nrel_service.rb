class NrelService

  def initialize
    @connection = Faraday.new(url: "https://developer.nrel.gov/api/alt-fuel-stations/v1.json?")
    @connecton.headers[:Authorization] = ENV["nrel_api_key"]
  end

  def parse(response)
    JSON.parse(response.body)
  end

  def station_hash
    parse(@connection.get "fuel_type=LPG,ELEC&zip=80206&limit=10")
  end

end
