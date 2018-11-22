module GeokitHelper
  require 'geokit'
  def near_branch
    loc =  Geokit::Geocoders::MultiGeocoder.geocode(request.remote_ip)
    storages = Storage.all

    min = storages[0]
    minDistance = loc.distance_to(Geokit::Geocoders::GoogleGeocoder.geocode "#{min.latitude},#{min.longitude}")

    storages.each do | s |
      branch_location = Geokit::Geocoders::GoogleGeocoder.geocode "#{s.latitude},#{s.longitude}"
      x = loc.distance_to(branch_location)

      if (minDistance > x)
        minDistance = x
        min = s
      end
    end
    return min.branch
  end
end
