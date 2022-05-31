class CatsController < ApplicationController
  before_action :set_cat, only: [:show, :edit]

  def index
    @cats = Cat.all
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_path(@cat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def show
  #   @cat = Cat.find(params[:id])
  # end

  # def edit
  #   @cat = Cat.find(params[:id])
  # end

  # def update
  #   @cat = Cat.find(params[:id])
  # end

  # def destroy

  # end

  private

  def set_cat
    @cat = Cat.find(params[:id])
  end

  def cat_params
    params.require(:cat).permit!
  end

end
