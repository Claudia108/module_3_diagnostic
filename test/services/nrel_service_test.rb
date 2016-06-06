require 'test_helper'

class RrelServiceTest < ActiveSupport::TestCase
  test "#stations" do
    VCR.use_cassette('stations') do
      service = NrelService.new
      stations = service.stations_hash

      refute stations.nil?
      assert_equal "asdf", stations[0][:name]
    end
  end

end
