class BusinessesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :home]
  before_action :find_business, only: [:show, :edit, :update, :destroy, :book]

  def home
    @categories = Business::CATEGORIES
  end

  def index
    @businesses = Business.all
  end

  def show
    authorize @business
    @business
  end

  def new
    @business = Business.new
  end

  def edit
    authorize @business
  end

  def create
    @business = Business.new(business_params)
    authorize @business
    @business.owner = current_user

    if @business.save
      redirect_to business_path(@business), notice: 'You are in the market!'
    else
      flash[:alert] = 'Something went wrong. Please review your errors'
      render :new
    end
  end

  def update
    authorize @business
    if @business.update(business_params)
      redirect_to business_path(@business), notice: "#{@business.name} info updated."
    else
      flash[:alert] = 'Something went wrong. Please review your errors'
      render :edit
    end
  end

  def destroy
    authorize @business
    @business.destroy
    redirect_to businesses_path
  end

  def book
    @settlement = Settlement.new
    @settlement.user = current_user
    @settlement.business = @business
    if @settlement.save
      flash[:notice] = "You have a this item"
      redirect_to business_path(@business)
    else
      flash[:alert] = "Sorry!"
      redirect_to business_path(@business)
    end
  end

  private

  def business_params
    params.require(:business).permit(:title, :budget, :rating, :location, :photo, :calendar, :category)
  end

  def find_business
    @business = Business.find(params[:id])
  end
end
