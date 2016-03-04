class Question < ActiveRecord::Base
	belongs_to :user
	has_many :answers
	has_many :comments, as: :commentable
	has_many :votes, as: :votable
	validates :title, presence: true
	validates :body, presence: true
	validates :user, presence: true
end