# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

questionoranswer = ["Question", "Answer"]
votevalue = [-1,1,1]

5.times do |i|
  User.create(username: Faker::Internet.user_name, password: "password")
end

25.times do |i|
  Question.create(title: Faker::Hipster.sentence, body: Faker::Hipster.paragraph(rand(1..5)), user_id: rand(1..5))
end

50.times do |i|
  Answer.create(body: Faker::Hipster.paragraph(rand(1..3)), user_id: rand(1..5), question_id: rand(1..25))
end

100.times do |i|
  Comment.create(body: Faker::Hipster.paragraph(rand(1..3)), user_id: rand(1..5), commentable_type: questionoranswer.sample, commentable_id: rand(1..25))
end

500.times do |i|
  Vote.create(direction_value: votevalue.sample, user_id: rand(1..5), votable_type: questionoranswer.sample, votable_id: rand(1..25))
end
