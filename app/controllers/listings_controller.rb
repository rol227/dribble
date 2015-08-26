class ListingsController < ApplicationController

	def new
		@organization = Organization.find(params[:organization_id])
		@event = @organization.events.new
		@listing = @event.listings.new
	end

	def create
		@organization = Organization.find(params[:organization_id])
		@event = @organization.events.build
		@listing = @event.listings.build(listing_params)
		@listing.organization_id = @organization.id

		if @listing.save
			redirect_to organization_path(@organization)
		else
			render 'new'
		end
	end

	private

	def listing_params
		params.require(:listing).permit(:title, :the_when, :vip_id, :event_id)
	end

end
