class Restaurant < ActiveRecord::Base
  belongs_to :owner

  validates :name, :description, :street_1, :city, :zip, :state, :phone, :owner_id,
    presence: true
  validate :not_mcdonalds

  def street_address
    return street_1 if street_2.blank?
    [street_1, street_2].join(", ")
  end

  def not_mcdonalds
    errors.add(
      :name, "Unable to accept McDonalds restaurants due to trademark infringement"
    ) if name == "McDonalds"
  end
end

# == Schema Information
#
# Table name: restaurants
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  street_1    :string(255)
#  street_2    :string(255)
#  city        :string(255)
#  zip         :string(255)
#  state       :string(255)
#  phone       :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  owner_id    :integer
#
