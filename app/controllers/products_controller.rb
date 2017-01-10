class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully created"
      redirect_to products_path
    else
      render 'new'
    end
  end

  def show
    set_product
  end

  def edit
    set_product
  end

  def update
    set_product
    if @product.update_attributes(product_params)
      flash[:notice] = "Product successfully updated"
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    set_product
    @product.destroy
    flash[:notice] = "Product successfully deleted"
    redirect_to products_path
  end

  private

    def product_params
      params.require(:product).permit(:title, :description, :image_url, :price)
    end

    def set_product
      @product = Product.find(params[:id])
    end
end
