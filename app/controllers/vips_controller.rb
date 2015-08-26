class VipsController < ApplicationController
	def new
		@organization = Organization.find(params[:organization_id])
		@vip = @organization.vips.new
	end

	def create
		@organization = Organization.find(params[:organization_id])
		@vip = @organization.vips.build(vip_params)

		if @vip.save
			redirect_to organization_path(@organization)
		else
			render 'new'
		end
	end

	private

	def vip_params
		params.require(:vip).permit(:name, :organization_id)
	end
end
