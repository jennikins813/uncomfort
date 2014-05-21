class ResultsController < ApplicationController

	def show
		@result = Result.find(params[:id])
	end

	def create
		@result = Result.new(result_params)
		if @result.save 
			redirect_to result_url(@result)
		else
			render 'quizzes/new'
		end
	end

	def result_params
		params.require(:result).permit(:score, :emotional_result, :physical_result)
	end
end