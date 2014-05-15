class User < ActiveRecord::Base
  has_many :answers
  has_many :questions, through: :answers
  has_one :result
  	
  authenticates_with_sorcery!

  validates :password, length: {minimum: 6}
  validates :password, confirmation: true
  validates :password_confirmation, presence: true
  
  validates :email, uniqueness: true
end
