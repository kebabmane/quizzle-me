class Device < ActiveRecord::Base
	include Tokenable

	validates :registration_id, uniqueness: true

end
