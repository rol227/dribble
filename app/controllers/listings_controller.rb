class ListingsController < ApplicationController

	def new
		@organization = Organization.find(params[:organization_id])
		@listing = @organization.listings.new
	end

	def create
		@organization = Organization.find(params[:organization_id])
		@listing = @organization.listings.build(listing_params)
		
		if @listing.save
			redirect_to organization_path(@organization)
		else
			render 'new'
		end
	end

	private

	def listing_params
		params.require(:listing).permit(:title, :the_when, :vip_id, :organization_id)
	end

end
