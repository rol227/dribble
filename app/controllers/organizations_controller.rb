class OrganizationsController < ApplicationController

	def index
		@organizations = Organization.all
	end

	def show
		@organization = Organization.find(params[:id])
	end

	def new
		@organization = Organization.new
	end

	def create
		@organization = Organization.new(org_params)

		if @organization.save
			redirect_to organization_path(@organization)
		else
			render 'new'
		end
	end

	private

	def org_params
		params.require(:organization).permit(:title)
	end
end
