class VipsController < ApplicationController
	before_action :find_organization, only: [:index, :new, :create, :edit, :update, :destroy, :show]
	before_action :find_vip, only: [:show, :edit, :update, :destroy]

	def index
		@vips = @organization.vips.all
	end

	def show
	end
	
	def new
		@vip = @organization.vips.new
	end

	def edit
	end

	def create
		@vip = @organization.vips.build(vip_params)

		if @vip.save
			redirect_to organization_path(@organization)
		else
			render 'new'
		end
	end

	def update
		if @vip.update(vip_params)
			redirect_to @organization
		else
			render 'edit'
		end
	end

	def destroy
		@vip.destroy
		redirect_to @organization
	end

	private

	def find_organization
		@organization = Organization.find(params[:organization_id])
	end

	def find_vip
		@vip = Vip.find(params[:id])
	end

	def vip_params
		params.require(:vip).permit(:name, :organization_id)
	end

end
