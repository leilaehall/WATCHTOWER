class WatchesController < ApplicationController
  #skip_before_action :authenticate_user!, only:[:show]
  def show
    @watch = Watch.find(params[:id])
  end

end
