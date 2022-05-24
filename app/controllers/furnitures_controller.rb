class FurnituresController < ApplicationController
before_action :set_furniture, only: [:show, :edit, :update, :destroy]
skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @furnitures = policy_scope(Furniture)
  end

  def show
    authorize @furniture
  end

  def new
    @furniture = Furniture.new
    authorize @furniture
  end

  def create
    @furniture = Furniture.new(params_furniture)
    authorize @furniture
    @furniture.user = current_user
    if @furniture.save
      redirect_to furniture_path(@furniture)
    else
      render :new
    end
  end

  def edit
    authorize @furniture
  end

  def update
    authorize @furniture
    @furniture.update(params_furniture)
    redirect_to furniture_path(@furniture)
  end

  def destroy
    authorize @furniture
    @furniture.destroy
    redirect_to furnitures_path, status: :see_other
  end

  private

  def set_furniture
    @furniture = Furniture.find(params[:id])
  end

  def params_furniture
    params.require(:furniture).permit(:name, :description, :price_per_day)
  end
end