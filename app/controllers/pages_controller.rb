class PagesController < ApplicationController
  def home
    @cats = Cat.all
  end
end
