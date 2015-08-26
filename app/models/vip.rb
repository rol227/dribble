class Vip < ActiveRecord::Base
  belongs_to :organization
  has_many :listings
  has_many :events, :through => :listings
end
