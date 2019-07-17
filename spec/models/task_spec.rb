require 'rails_helper'

RSpec.describe Task, type: :model do
  before do
    @task = Task.create(title: "Buy eggs", description: "Buy 18 brown, cage-free egs", status: 0, due_date: Date.today + 1)
  end
  
  it "can be created" do
    expect(@task).to be_valid    
  end

  it "cannot be created without a title" do
    @task.update(title: nil)
    expect(@task).to_not be_valid
  end

end
