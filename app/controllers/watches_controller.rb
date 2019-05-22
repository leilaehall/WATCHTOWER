class WatchesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @watches = Watch.all
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
