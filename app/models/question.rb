class Question < ActiveRecord::Base
	belongs_to :user
	has_many :answers, dependent: :destroy
	has_many :comments, as: :commentable, dependent: :destroy
	has_many :votes, as: :votable, dependent: :destroy
	validates :title, presence: true
	validates :body, presence: true
	validates :user, presence: true

  def has_not_been_rated_by_user(user)
   !self.votes.find_by(user: user)
  end

  def vote_count
    self.votes.sum(:direction_value)
  end

  def self.trending
    Question.all.order(updated_at: :desc).limit(5)
  end
end
