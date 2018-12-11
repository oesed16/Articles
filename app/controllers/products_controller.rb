class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)

    params[:categories].each do |category_id|
      category = Category.find(category_id)
      @product.categories << category
    end

    if @product.save
      redirect_to products_path
    else
      render :new 
    end
  end

  def edit
    @product = Product.find(params[:id])
		@categories = Category.all
  end

  def update
    @product = Product.find(params[:id])

		params[:categories].each do |category_id|
			category = Category.find(category_id)
		  @product.categories << category
    end
    
 		if @product.update(product_params)
			redirect_to products_path  
		else
			render :edit
    end
    
  end
  
  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to products_path
  end

  private
  def product_params
    params.require(:product).permit(:name, :price, :categories)
  end
end
