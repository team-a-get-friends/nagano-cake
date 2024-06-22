class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def update
  end

  def index
    @orders = Order.all
  end

end
