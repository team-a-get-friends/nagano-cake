class Public::HomesController < ApplicationController

  def top
    @item = Item.latest
  end

  def about
  end

end
