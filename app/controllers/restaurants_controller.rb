class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/1
  def show
    @restaurant = Restaurant.find(params[:id])
  end

  # POST /restaurants
  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to @restaurant, notice: "Restaurant was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # # PATCH/PUT /restaurants/1
  # def update
  #   if @restaurant.update(restaurant_params)
  #     redirect_to @restaurant, notice: "Restaurant was successfully updated.", status: :see_other
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  # # DELETE /restaurants/1
  # def destroy
  #   @restaurant.destroy!
  #   redirect_to restaurants_url, notice: "Restaurant was successfully destroyed.", status: :see_other
  # end

  private

  # Use callbacks to share common setup or constraints between actions.

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  # Only allow a list of trusted parameters through.

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
