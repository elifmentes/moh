class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    # @user = current_user
  end

  def show
  #   @category = Category.find(params[:id])
  #   @businesses = Business.where(category: @category)
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
