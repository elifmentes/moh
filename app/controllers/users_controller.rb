class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :businesses]
  before_action :authorize_user, only: [:edit, :show, :update, :businesses]

  def show
    @o_businesses = Business.where(owner: @user)
    @businesses = Settlement.where(user: @user)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User is successfully updated.'
    else
      render :edit
    end
  end

  def businesses
    @owned_businesses = Business.where(owner: @user)
    @businesses = Settlement.where(user: @user).map { |b| b.business }
  end

  private

  def authorize_user
    authorize @user
  end

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:photo, :username)
  end
end
