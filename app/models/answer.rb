class Answer < ActiveRecord::Base
	belongs_to :user
	belongs_to :question, touch: true
	has_many :comments, as: :commentable, dependent: :destroy
	has_many :votes, as: :votable, dependent: :destroy
	validates :body, presence: true

  def has_not_been_rated_by_user(user)
   !self.votes.find_by(user: user)
  end

  def vote_count
    self.votes.sum(:direction_value)
  end

end
