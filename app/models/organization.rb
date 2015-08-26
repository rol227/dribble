class Organization < ActiveRecord::Base
	has_many :events
	has_many :vips
	has_many :listings
end
