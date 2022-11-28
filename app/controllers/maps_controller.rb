class MapsController < ApplicationController
  def index
  end


def map
  customer_address = Geocoder.search(params[:address])
  delivery_address = Geocoder.search(params[:address])
  @latlng = customer_address.first.coordinates
  @latlng.save
  # これでmap.js.erbで、経度緯度情報が入った@latlngを使える。

  # respond_to以下の記述によって、
  # remote: trueのアクセスに対して、
  # map.js.erbが変えるようになります。
  respond_to do |format|
    format.js
  end
end
end