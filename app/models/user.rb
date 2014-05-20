class User < ActiveRecord::Base
  authenticates_with_sorcery!
  #after_create :build_profile

  has_many :answers
  has_many :questions, through: :answers
  has_one :result
  #has_one :profile
  #accepts_nested_attributes_for :profile
  mount_uploader :image, ImageUploader

  acts_as_taggable

  validates :password, length: {minimum: 6}
  validates :password, confirmation: true
  #validates :password_confirmation, presence: true
  
  validates :email, uniqueness: true

  #def build_profile
  #  Profile.create(user: self)
  #end
end
