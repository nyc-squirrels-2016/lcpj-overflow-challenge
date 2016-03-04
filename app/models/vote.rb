class Vote < ActiveRecord::Base
	belongs_to :votable, polymorphic: true, touch: true
	belongs_to :user
	validates :direction_value, null: false
end
