require "rails_helper"

describe "index" do
  before do
    visit tasks_path
  end

  it "can be reached successfully" do
    expect(page.status_code).to eq(200)
  end

  it "shows a title of 'Tasks'" do
    expect(page).to have_content(/Task/)
  end

  it "has a list of tasks" do
    first_task = Task.create(title: "Task 1", description: "Meow dui in ligula mollis ultricies.", status: 0)
    second_task = Task.create(title: "Task 2", description: "Phasellus at dui in ligula mollis meow.", status: 0)

    expect(Task.count).to eq(2)
  end

  describe "creation" do
    before do
      visit new_task_path
    end

    it "can be reached successfully" do
      expect(page.status_code).to eq(200)      
    end

    it "can create a new task" do
   
    fill_in "Title", with: "Buy veggies"
    fill_in "Description", with: "carrots, cabbage, and cucumbers"
   
    expect { click_on "Create Task" }.to change(Task, :count).by(1)
    end

    it "redirects to the Index page after saving a new task" do
      fill_in "Title", with: "Buy veggies"
      fill_in "Description", with: "carrots, cabbage, and cucumbers"

      click_on "Create Task"

      expect(page).to have_content("Tasks")
    end
  end
end
