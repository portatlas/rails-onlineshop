class ProductsController < ApplicationController

  before_filter :authorize

  def index
    @products = Product.all
    # @product_order = current_order.product_orders.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def edit
    @product = Product.find(params[:id])
    @categories = Category.all
  end

  def create
    cat_ids = params[:checkboxes].map {|cat_id| Category.find(cat_id)}
    @product = Product.new(product_params)
    @product.categories = cat_ids

    if @product.save
      redirect_to admin_index_path, notice: 'Product was created.'
    else
      render 'new'
    end
  end

  def update
    # binding.pry
    @product = Product.find(params[:id])
    if params[:checkboxes] != nil
      cat_ids = params[:checkboxes].map {|cat_id| Category.find(cat_id)}
      @product.categories = cat_ids
    else
      @product.categories = []
    end

    if @product.update(product_params)
      redirect_to admin_index_path, notice: 'Product was edited.'
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to admin_index_path, notice: 'Product was destroyed.'
  end

  private
    def product_params
      params.require(:product).permit(:name, :brand, :description, :price, :discount, :stock_count, :img_url)
    end

end
