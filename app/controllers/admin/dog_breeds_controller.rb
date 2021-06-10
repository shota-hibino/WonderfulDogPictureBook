class Admin::DogBreedsController < ApplicationController
  before_action :set_genres, only: [:new, :edit, :index, :create, :update]
  before_action :authenticate_admin!

  def index
    @dog_breeds = DogBreed.all.page(params[:page]).per(8)
  end

  def new
    @dog_breed = DogBreed.new
    @genres = Genre.all
  end

  def create
    @dog_breed = DogBreed.new(dog_breed_params)
    if @dog_breed.save
      redirect_to admin_dog_breed_path(@dog_breed)
    else
      render :new
    end
  end

  def show
    @dog_breed = DogBreed.find(params[:id])
  end

  def edit
    @dog_breed = DogBreed.find(params[:id])
    @genres = Genre.all
  end

  def update
    @dog_breed = DogBreed.find(params[:id])
    if @dog_breed.update(dog_breed_params)
      redirect_to admin_dog_breeds_path(@dog_breed)
    else
      render :edit
    end
  end

  private
  def dog_breed_params
    params.require(:dog_breed).permit(:genre_id, :dog_image, :dog_name, :dog_introduction)
  end

  def set_genres
    @genres = Genre.where(is_valid: true)
  end
end
