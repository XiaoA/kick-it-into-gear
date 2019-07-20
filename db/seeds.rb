sherlock = User.create(id: 1, first_name: "Sherlock", last_name: "Holmes", username: "sherlock", password: "password", password_confirmation: "password", email: "sherlock@example.com")

batman = User.create(id: 2, first_name: "Bruce", last_name: "Wayne", username: "batman", password: "password", password_confirmation: "password", email: "batman@example.com")


puts "Two new users have been created."

5.times do |task|
  Task.create!(title: "Sherlock task #{task}", description: "Donec pretium posuere tellus.", status: 0, user_id: sherlock.id)
end

5.times do |task|
  Task.create!(title: "Batman task #{task}", description: "Donec pretium posuere tellus.", status: 0, user_id: batman.id)
end

puts "Five new tasks have been created for each user."
