class User < ActiveRecord::Base
  authenticates_with_sorcery!
  #after_create :build_profile

  has_many :answers
  has_many :questions, through: :answers
  has_one :result
  has_many :friendships
  has_many :friends, :through => :friendships  
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user  
 
  has_many :received_comments, :class_name => "Comment"  # this uses user_id on comments table.
  has_many :comments, class_name: 'Comment', foreign_key: 'commenter_id'

  #has_one :profile
  #accepts_nested_attributes_for :profile
  mount_uploader :image, ImageUploader

  acts_as_taggable

  validates :password, length: {minimum: 6}
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  
  validates :email, uniqueness: true

  #def build_profile
  #  Profile.create(user: self)
  #end
end
