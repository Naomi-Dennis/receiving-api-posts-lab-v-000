class ProductsController < ApplicationController
  def index
    @products = Product.all
    respond_to do | format | 
	format.html {render :index }
	format.json {render json: @products.to_json } 
    end 
  end

  def inventory
    product = Product.find(params[:id])
    render plain: product.inventory > 0 ? true : false
  end

  def description
    product = Product.find(params[:id])
    render plain: product.description
  end

  def new
    @product = Product.new
  end

  def create
    created_product = Product.create!(product_params)
    #redirect_to products_path
   #redirect_to new_product_path
   render json: created_product.as_json
  end

  def show
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @product }
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :inventory, :price)
  end
end
