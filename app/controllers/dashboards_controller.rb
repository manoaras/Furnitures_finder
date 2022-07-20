class DashboardsController < ApplicationController
  def index
    @dashboard = policy_scope(Booking)
  end
end
