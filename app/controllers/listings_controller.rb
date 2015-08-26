class ListingsController < ApplicationController
	before_action :find_listing, only: [:edit, :update, :destroy]
	before_action :find_organization, only: [:new, :create, :edit, :update, :destroy]

	def index
	end

	def show
	end

	def new
		@listing = @organization.listings.new
	end

	def edit
	end

	def create
		@listing = @organization.listings.build(listing_params)
		
		if @listing.save
			redirect_to @organization
		else
			render 'new'
		end
	end

	def update
		if @listing.update(listing_params)
			redirect_to @organization
		else
			render 'edit'
		end
	end

	def destroy
		@listing.destroy
		redirect_to @organization
	end

	private

	def find_listing
		@listing = Listing.find(params[:id])
	end

	def find_organization
		@organization = Organization.find(params[:organization_id])
	end

	def listing_params
		params.require(:listing).permit(:title, :the_when, :vip_id, :organization_id)
	end

end
