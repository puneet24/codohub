class Problem < ActiveRecord::Base
	has_many :comments
	has_many :submissions
	belongs_to :user
end
