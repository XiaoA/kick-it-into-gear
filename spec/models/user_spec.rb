require 'rails_helper'

RSpec.describe User, type: :model do

  describe "creation" do
    user = FactoryBot.build_stubbed(:user)

    it "can be created" do
      expect(user).to be_valid
    end
  end
  
  describe "Active Record Associations" do
    it { should have_many(:tasks) }
  end

  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:password_confirmation) }
    it { should validate_presence_of(:email) }
  end
end
