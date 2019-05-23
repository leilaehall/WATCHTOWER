class WatchesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

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
