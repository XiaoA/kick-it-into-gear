require "rails_helper"

describe "index" do
  before do
    visit tasks_path
  end

  it "can be reached successfully" do
    expect(page.status_code).to eq(200)
  end

  it "shows a list of tasks" do
    expect(page).to have_content(/Task/)
  end
    
end
