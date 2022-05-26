class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @furnitures = Furniture.last(6)
  end
end
