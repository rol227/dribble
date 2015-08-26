class AddOrganizationIdToListings < ActiveRecord::Migration
  def change
    add_reference :listings, :organization, index: true, foreign_key: true
  end
end
