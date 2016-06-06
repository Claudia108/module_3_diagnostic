class Station < OpenStruct

  def self.all
    stations = NrelService.new.stations_hash[:fuel_stations]
    stations.each do |station|
      Station.new(station)
    end
  end

end
