require 'faker'

10.times do |i|
	Comment.create(content: Faker::Company.catch_phrase, likes: rand(1..5))
end