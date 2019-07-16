5.times do |task|
  Task.create!(title: "Complete task #{task}", description: "Donec pretium posuere tellus.", status: 0)
end

puts "Five new tasks have been created."
