FactoryBot.define do
  factory :user do
    id { 1 }
    first_name { 'John' }
    last_name { 'Smith' }
    email { 'john@example.com' }
    password { 'password' }
    password_confirmation { 'password' }
    username { 'john99' }
    created_at { Date.today }
    updated_at { Date.today }
  end
end
