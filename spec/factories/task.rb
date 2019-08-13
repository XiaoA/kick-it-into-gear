FactoryBot.define do
  factory :task do
    id { 1 }
    title { 'Renew my subscription'}
    description { 'My subcription is about to expire' }
    status { 'Todo' }
    user_id { 1 }
    created_at { Date.today }
    updated_at { Date.today }
  end
end
