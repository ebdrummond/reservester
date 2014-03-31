class Restaurant < ActiveRecord::Base

  validates :name, :description, :street_1, :city, :zip, :state, :phone,
    presence: true

end
