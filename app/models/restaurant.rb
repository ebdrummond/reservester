class Restaurant < ActiveRecord::Base

  validates :name, :description, :street_1, :city, :zip, :state, :phone,
    presence: true

  def street_address
    return street_1 if street_2.blank?
    [street_1, street_2].join(", ")
  end
end
