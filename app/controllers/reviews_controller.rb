class ReviewsController < ApplicationController

	def index

		@number = rand(100)

		#see all reviews on the page (used to be manually inputted)
		@reviews = Review.all

	end

	def new
		# the form for adding a review
	@review = Review.new	

	end

	def create 
		# take info from the form and add to the database
		@review = Review.new(form_params)

		#we want to check if the model can be saved
		#if it is we'll go to the homepage
		#if it isnt then show the new form

		if @review.save
			redirect_to root_path
		else
			#show the view for new.html
			render "new"

		end

	end



	def show

		#individual review page
		@review = Review.find(params[:id])
	end

	def destroy
		#find individual review
		@review = Review.find(params[:id])
		#destroy
		@review.destroy

		#redirect to homepage
		redirect_to root_path
	end

	def edit
		#find individual review (to edit)
		@review = Review.find(params[:id])
	end

	def update
		#find individual review
		@review = Review.find(params[:id])


		#update with new info
		if @review.update(form_params)

			#redirect somewhere new

			redirect_to review_path(@review)

		else
		render "edit" 
		end
	end

	def form_params
		params.require(:review).permit(:title, :body, :score)

	end

end
