class PagesController < ApplicationController
  def home
    @cats = Cat.all
  end

  def show
    @cat = Cat.find(params[:id])
  end
end
