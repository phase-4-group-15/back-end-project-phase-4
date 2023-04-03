class ReviewsController < ApplicationController
    

    def create
        review = Review.new(review_params)
        if review.save
          render json: review, status: :created
        else
          render json: { errors: review.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def index
        render json: Review.all
    end

    def show
        review = Review.find(params[:id])
        render json: review
    end

    def update
        review = Review.find(params[:id])
        if review
            review.update(review_update_params)
        render json: review
        else
            render json: { error: "Review not found" }, status: :not_found
        end
    end
end
