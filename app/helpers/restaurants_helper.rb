module RestaurantsHelper

  def city_state_zip(restaurant)
    "#{restaurant.city}, #{restaurant.state} #{restaurant.zip}"
  end
end
