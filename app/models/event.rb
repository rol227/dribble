class Event < ActiveRecord::Base
  belongs_to :organization
  has_many :listings
  has_many :vips, :through => :listings
end
