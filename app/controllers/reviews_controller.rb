class ReviewsController < ApplicationController

  before_action :load_product

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end

  private

  def review_params
    params.require(:review).permit(:comment, :user_id, :product_id)
  end

  def load_product
    @product = Product.find(params[:product_id])
  end

end
