class ReviewsController < ApplicationController
    
    def index
      render json: Review.all
    end
  
    def show
      review = Review.find(params[:id])
      render json: review
    end
  
    def create
      review = Review.new(review_params)
      if review.save
        render json: review, status: :created
      else
        render json: { error: review.errors.full_messages.join(', ') }, status: :unprocessable_entity
      end
    end
  
    def update
      review = Review.find(params[:id])
      if review.update(review_params)
        render json: review
      else
        render json: { error: review.errors.full_messages.join(', ') }, status: :unprocessable_entity
      end
    end
  
    def destroy
      review = Review.find(params[:id])
      review.destroy
      head :no_content
    end
  
    private
  
    def review_params
      params.require(:review).permit(:comment, :rating, :user_id, :article_id)
    end
  
  end
  