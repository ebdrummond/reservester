require 'spec_helper'

describe Restaurant do
  let(:restaurant) {
    Restaurant.new(
      name: "restaurant",
      description: "yummy food",
      street_1: "123 Street",
      city: "Chicago",
      zip: "60657",
      state: "IL",
      phone: "(312) 555-5555"
    )
  }

  let(:owner) {
    Owner.create!(
      first_name: "Mary",
      last_name: "Owner",
      email: "mary@example.com",
      password: "password"
    )
  }


  it "requires an owner" do
    expect(restaurant).to_not be_valid
  end

  it "requires a name" do
    restaurant.name = nil
    expect(restaurant).to_not be_valid
  end

  it "requires a description" do
    restaurant.name = nil
    expect(restaurant).to_not be_valid
  end

  it "requires a street address" do
    restaurant.street_1 = nil
    expect(restaurant).to_not be_valid
  end

  it "requires a city" do
    restaurant.city = nil
    expect(restaurant).to_not be_valid
  end

  it "requires a zip" do
    restaurant.zip = nil
    expect(restaurant).to_not be_valid
  end

  it "requires a state" do
    restaurant.state = nil
    expect(restaurant).to_not be_valid
  end

  it "requires a phone" do
    restaurant.phone = nil
    expect(restaurant).to_not be_valid
  end

  it "is valid with all required attributes" do
    restaurant.owner = owner
    expect(restaurant).to be_valid
  end
end
