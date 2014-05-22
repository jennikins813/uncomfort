class Comment < ActiveRecord::Base
	belongs_to :user   # the user (profile) that this comment belongs to
	belongs_to :commenter, class_name: 'User'  # person that made this comment.
	
	#belongs_to :owner, class_name: 'User'
	
	belongs_to :tag
end
