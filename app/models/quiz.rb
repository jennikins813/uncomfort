class Quiz < ActiveRecord::Base
	has_many :questions
	has_many :results

	accepts_nested_attributes_for :questions
end
