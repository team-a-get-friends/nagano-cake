class Admin::CustomersController < ApplicationController

  def index
    #管理者の顧客一覧記述
    @customers = Customer.all
  end

  def show
  end

  def edit
  end

  def update
  end

end
