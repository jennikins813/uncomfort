class Profile < ActiveRecord::Base
	belongs_to :user
	mount_uploader :photo, ImageUploader

	acts_as_taggable	
end
