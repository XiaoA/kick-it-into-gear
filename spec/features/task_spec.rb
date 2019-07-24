require "rails_helper"

describe "Task Actions", type: :feature do
  describe "index" do
    before do
      @user = FactoryBot.create(:user)
      login_as(@user, :scope => :user)

      visit root_path
    end

    it "can be reached successfully" do
      expect(page.status_code).to eq(200)
    end

    it "displays a list of tasks" do
      first_task = Task.create!(title: "Task 1", description: "Meow dui in ligula mollis ultricies.", status: 0, user_id: @user.id)
      second_task = Task.create!(title: "Task 2", description: "Phasellus at dui in ligula mollis meow.", status: 0, user_id: @user.id)

      expect(Task.count).to eq(2)
    end
  end

  describe "create" do
    before do
      @user = FactoryBot.create(:user)
      login_as(@user, :scope => :user)

      visit root_path
      click_on "Add Task"
    end

    it "can create a new task" do
      fill_in "Title", with: "Buy veggies"
      fill_in "Description", with: "I need more veggies in my life"

      click_on "Create Task"
    end

    it "does not redirect from the Index page after saving a new task" do
      fill_in "Title", with: "Buy veggies"
      fill_in "Description", with: "carrots, cabbage, and cucumbers"

      click_on "Create Task"
      expect(current_path).to eq(root_path)
      expect(Task.count).to eq(1)
    end
  end

  describe "show" do
    before do
      @user = FactoryBot.create(:user)
      login_as(@user, :scope => :user)
    end
    
    it "can be reached successfully" do
      visit tasks_path(@task)
      expect(page.status_code).to eq(200)
    end

    it "displays the current task" do
      task = Task.create(title: "buy a cat", description: "Meow dui in ligula mollis ultricies.", status: 0, due_date: Date.today, user_id: @user.id)
      visit tasks_path(task)
      expect(page).to have_content(/buy a cat/)
    end
  end

  describe "edit" do
    before do
      @user = FactoryBot.create(:user)
      login_as(@user, :scope => :user)
      @task = Task.create(title: "Buy bread", description: "Get some bread.", status: 0, user_id: @user.id)
    end

    it "can be edited" do
      visit root_path
      click_on "Edit"
      
      find("#task_title").set("").set("Buy wheat bread")
      click_on "Update Task"
    end
  end

  describe "delete", js: true do

    it "can be deleted" do
      user = FactoryBot.create(:user)
      login_as(user, :scope => :user)

      
      task = Task.create(title: "Buy bread", description: "Get some bread.", status: 0, user_id: user.id)   
      visit root_path
      click_on "Delete"

      expect(Task.count).to eq(0)
    end
  end
end



