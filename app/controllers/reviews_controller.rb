class ReviewsController < ApplicationController

  before_action :load_product
  before_action :ensure_logged_in

  def new
    @review = Review.new
  end

  def create
    @review = @product.reviews.build(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to product_path(@product), notice: "Successfully added your comment"
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.delete
  end

  private

  def review_params
    params.require(:review).permit(:comment, :product_id)
  end

  def load_product
    @product = Product.find(params[:product_id])
  end

end
