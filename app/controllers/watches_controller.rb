class WatchesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index]

  def index
    @watches = Watch.all
  end
end
