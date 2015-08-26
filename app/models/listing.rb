class Listing < ActiveRecord::Base
  belongs_to :vip
  belongs_to :organization
end
