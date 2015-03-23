class Comment < ActiveRecord::Base
	belongs_to :problem
	belongs_to :user
end
