class CategoriesController < ApplicationController

  before_action :set_category, only: [:update, :show, :destroy, :edit]

  def index
    @categories = Category.all
  end

  def show

  end

  def new
    @category = Category.new
    # @category = Category.find(params[:id])
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, success: 'Категория успешно создана'
    else
      flash[:danger] = 'Категория не создана'
      render :new
    end
  end

  def edit

  end

  def update
    if @category.update_attributes(category_params)
      redirect_to categories_path, success: 'Категоря успешно обновлена'
    else
      flash[:danger] = 'Категория не обновлена'
      render :update
    end
  end

  def destroy
    @category.destroy
    redirect_to posts_path, success: 'Категория удалена'
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  end

end
