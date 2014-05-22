class Comment < ActiveRecord::Base
	belongs_to :user
	#belongs_to :owner, class_name: 'User'
	#belongs_to :commenter, class_name: 'User'
	belongs_to :tag
end
