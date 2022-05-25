class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @furnitures = Furniture.last(4)
  end
end
