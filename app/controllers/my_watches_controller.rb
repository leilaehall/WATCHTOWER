class MyWatchesController < ApplicationController
  def new
    @watch = Watch.new
  end

  def index
    @watches = Watch.where(user: current_user)
  end

  def create
    @watch = Watch.new(watch_params)
    @watch.user = current_user

    if @watch.save
      flash[:notice] = "Your watch has been successfully created"
      redirect_to my_watches_path
      # redirect_to my_watches_path
    else
      render :new
    end
  end

  private

  def watch_params
    params.require(:watch).permit(
      :watch_brand,
      :watch_model,
      :watch_image,
      :watch_category,
      :rental_price,
      :retail_price,
      :gender,
      :availability_start,
      :availability_end
    )
  end
end
