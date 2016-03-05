FactoryGirl.define do

  factory :user do
    username {Faker::Internet.user_name}
    password "password"
  end

  factory :question do
    user
    title Faker::StarWars.quote.gsub(".", "?")
    body Faker::Hacker.say_something_smart
  end

  factory :answer do
    user
    question
    body "#{Faker::StarWars.quote} #{Faker::StarWars.quote} #{Faker::StarWars.quote}"
  end

  factory :question_comment, class: "Comment" do
    user
    association :commentable, factory: :question
    body Faker::StarWars.quote
  end

  factory :answer_comment, class: "Comment" do
    user
    association :commentable, factory: :answer
    body Faker::StarWars.quote
  end

  factory :question_vote, class: "Vote" do
    user
    association :votable, factory: :question
    direction_value [1, -1].sample
  end

  factory :answer_vote, class: "Vote" do
    association :votable, factory: :answer
    direction_value [1, -1].sample
  end

end
