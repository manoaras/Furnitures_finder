class FurnituresController < ApplicationController
before_action :set_furniture, only: [:show, :destroy]

  def index
    @furnitures = Furniture.all
  end

  def show() end

  def new
    @furniture = Furniture.new
  end

  def create
    @furniture = Furniture.new(furniture_params)
    if @furniture.save
      redirect_to furniture_path(@furniture)
    else
      render :new
    end
  end

  def delete
    @furniture.destroy
    redirect_to furnitures_path, status: :see_other
  end

  private

  def set_furniture
    @furniture = Furniture.find(params[:id])
  end
end
