# frozen_string_literal: true

class ReviewsController < ApplicationController
  def create
    @experience = Experience.find(params[:experience_id])
    @review = Review.new(review_params)
    @review.experience = @experience
    if @review.save
      redirect_to experience_path(@experience)
    else
      render "experiences/show"
    end
  end


  private

    def review_params
      params.require(:review).permit(:content)
    end
end
