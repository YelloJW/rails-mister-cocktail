class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @review = Review.new(review_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review.cocktail = @cocktail
    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @review = Review.find(params[:id])
    @cocktail = Cocktail.find(@review.cocktail_id)
    @review.delete
    redirect_to cocktail_path(@cocktail)
  end

  def review_params
    params.require(:review).permit(:name, :content, :rating)
  end
end
