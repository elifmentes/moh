class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    @user = current_user
  end

  # private

  # def category_params
  #   params.require(:category).permit(:name)
  # end
end
