class HomevisitsController < ApplicationController

	def new
		@homevisit = Homevisit.new
	end

	def show
		@homevisit = Homevisit.find(params[:id])
	end

	def index
		@client = Client.all
		@homevisits = Homevisit.all
	end

	def edit
		@homevisit = Homevisit.find(params[:id])
	end

	def create
		@homevisit = Homevisit.new(homevisit_params)
		render 'new' unless @homevisit.save
	end

	def update
		@homevisit = Homevisit.find(params[:id])
		if @homevisit.update(homevisit_params)
			redirect_to @homevisit
		else
			render 'edit'
		end
	end

	def destroy
		@homevisit = Homevisit.find(params[:id])
		@homevisit.destroy
		redirect_to homevisits_path
	end


	private

	def homevisit_params
		params.require(:homevisit).permit(:date_of_departure, :date_of_return, :client_id)
	end
end


