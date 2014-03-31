class RestaurantsController < ApplicationController
  before_action :authenticate_owner!, except: [:index, :show]
  before_filter :assign_restaurant, only: [:show, :edit, :update, :destroy]
  before_filter :validate_authorization, only: [:edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = current_owner.restaurants.build(restaurant_params)

    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
      flash[:notice] = "Restaurant created!"
    else
      flash[:error] = "Restaurant failed to save."
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @restaurant.update_attributes(restaurant_params)
      redirect_to restaurant_path(@restaurant)
      flash[:notice] = "Restaurant updated!"
    else
      flash[:error] = "Restaurant failed to save."
      render :edit
    end
  end

  def destroy
    @restaurant.destroy

    redirect_to restaurants_path, message: "Restaurant deleted."
  end

  private

  def assign_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def validate_authorization
    unless @restaurant.owner == current_owner
      redirect_to :back
      flash[:error] = "You are not authorized to perform this action."
    end
  end

  def restaurant_params
    params.require(:restaurant).permit(
      :name,
      :description,
      :street_1,
      :street_2,
      :city,
      :state,
      :zip,
      :phone
    )
  end
end
