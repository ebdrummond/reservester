require 'spec_helper'

describe Owner do
  let(:owner) {
    Owner.new(
      first_name: "Mary",
      last_name: "Owner",
      email: "mary@example.com",
      password: "password"
    )
  }

  it "requires a first name" do
    owner.first_name = nil
    expect(owner).to_not be_valid
  end

  it "requires a last name" do
    owner.last_name = nil
    expect(owner).to_not be_valid
  end

  it "requires an email" do
    owner.email = nil
    expect(owner).to_not be_valid
  end

  it "requires a password" do
    owner.password = nil
    expect(owner).to_not be_valid
  end

  it "is valid with all required attributes" do
    expect(owner).to be_valid
  end
end
