class CatsController < ApplicationController
  before_action :set_cat, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @cats = Cat.where("breed ILIKE ?", "%#{params[:query]}%")
    else
      @cats = Cat.all
    end
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.new(cat_params)
    @cat.user = current_user
    if @cat.save!
      redirect_to my_cats_path(@cat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @booking = Booking.new
    @cat = Cat.find(params[:id])
  end

  def edit
  end

  def update
    @cat.update(cat_params)
    redirect_to cat_path(@cat)
  end

  def users_cats
    @cats = Cat.where(user: current_user)
  end

  def destroy
    @cat.destroy
    redirect_to my_cats_path, status: :see_other
  end

  private

  def set_cat
    @cat = Cat.find(params[:id])
  end

  def cat_params
    params.require(:cat).permit(:name, :breed, :age, :description, photos: [])
  end

end
