class FurnituresController < ApplicationController
  before_action :set_furniture, only: %i[show edit update destroy]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @furnitures = policy_scope(Furniture)
    if params[:search].present?
      sql_query = "furnitures.name ILIKE :query OR furnitures.genre ILIKE :query"
      @furnitures = Furniture.where(sql_query, query: "%#{params[:search]}%")
    end
    @markers = @furnitures.geocoded.map do |furniture|
      {
        lat: furniture.latitude,
        lng: furniture.longitude,
        info_window: render_to_string(partial: "info_window", locals: { furniture: furniture })
      }
    end
  end

  def index_by_user
    @furnitures = Furniture.where(user_id: params[:id])
    authorize @furnitures
  end

  def show
    authorize @furniture
    @booking = Booking.new
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
    params.require(:furniture).permit(:name, :description, :city, :price_per_day, photos: [])
  end
end
