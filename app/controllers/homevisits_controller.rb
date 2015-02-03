class HomevisitsController < ApplicationController

	def new
		@client = Client.find(params[:client_id])
		@homevisit = Homevisit.new
	end

	def show
		@client = Client.find(params[:client_id])
		@homevisit = Homevisit.find(params[:id])
	end

	def index
		@client = Client.all
		@homevisits = Homevisit.order(:date_of_departure)
	end

	def edit
		@homevisit = Homevisit.find(params[:id])
	end

	def create
		@client = Client.find(params[:client_id])
		@homevisit = @client.homevisits.new(homevisit_params)
		if @homevisit.save
			redirect_to homevisits_path
		else
			render 'new'
		end
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


