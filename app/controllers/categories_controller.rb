class CategoriesController < ApplicationController

  before_filter :authorize

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(name: params[:category][:name])
    if @category.save
      redirect_to categories_path, notice: 'Category was created.'
    else
      render 'new'
    end
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(name: params[:category][:name])
      redirect_to admin_index_path,notice: 'Category was edited.'
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    redirect_to admin_index_path, notice: 'Category was deleted.'
  end

end
