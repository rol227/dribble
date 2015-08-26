class Vip < ActiveRecord::Base
  belongs_to :organization
  has_many :listings
end
