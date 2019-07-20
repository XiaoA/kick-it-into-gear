require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "creation" do
    user = FactoryBot.create(:user, id: 1)
    task = FactoryBot.create(:task)
    
    it "can be created" do
      expect(task).to be_valid    
    end
  end

  describe "Active Record Associations" do
    it { should belong_to(:user) }
    it { should have_db_index(:user_id) }
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
  end
end
