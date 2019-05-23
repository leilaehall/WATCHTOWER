class WatchesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @watches = Watch.all
    @watch_map = Watch.where.not(latitude: nil, longitude: nil)

    @markers = @watch_map.map do |watch|
      {
        lat: watch.latitude,
        lng: watch.longitude
      }
    end
  end

  def show
    @watch = Watch.find(params[:id])
  end

  def destroy
  @watch = Watch.find(params[:id])
    @watch.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to my_watches_path
  end
end
