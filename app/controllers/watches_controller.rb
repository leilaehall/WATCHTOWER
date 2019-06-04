class WatchesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :compare]

  def index

    if params[:query].present?

      conditions = <<~SQL
        watch_brand ILIKE :query OR
        watch_model ILIKE :query OR
        watch_category ILIKE :query OR
        gender ILIKE :query
        SQL

      @watches = Watch.where(conditions, query: "%#{params[:query]}%")

    else
      @watches = Watch.all
    end

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

  def compare
    @watch = Watch.find(params[:id])
    @scraper = Chrono24Scraper.new(@watch)
    @scraper.scrape
    p @scraper.url
    respond_to do |format|
      format.js
    end
  end
end
