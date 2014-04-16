class ProductsController < ApplicationController

before_action :require_login, except: [:index, :show]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])

    if current_user
      @review = @product.reviews.build
    end

  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path  
  end 

  private

  def product_params
    params.require(:product).permit(:name, :description, :price_in_cents)
  end

  def require_login
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to products_path, notice: "Welcome back!"
    else
      flash.now[:alert] = "Invalid email or password"
      redirect_to new_session_path
    end
  end
end
