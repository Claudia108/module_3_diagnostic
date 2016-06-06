require 'test_helper'

class RrelServiceTest < ActiveSupport::TestCase
  test "#stations" do
    VCR.use_cassette('stations') do
      service = NrelService.new
      stations = service.stations_hash

      refute stations.nil?
      assert_equal "CADACHARGEPOINT", stations[:fuel_stations][0][:station_name]
      assert_equal "290 E Speer Blvd", stations[:fuel_stations][0][:street_address]
      assert_equal "Denver", stations[:fuel_stations][0][:city]
      assert_equal "80203", stations[:fuel_stations][0][:zip]
      assert_equal "24 hours daily", stations[:fuel_stations][0][:access_days_time]
    end
  end

end
