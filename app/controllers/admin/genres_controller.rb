class Admin::GenresController < ApplicationController
  # 権限の設定：ログインしていないユーザーが作業できないように設定
  before_action :authenticate_admin!

  def index
  end

  def create
  end

  def edit
  end

  def update
  end

  private

end
