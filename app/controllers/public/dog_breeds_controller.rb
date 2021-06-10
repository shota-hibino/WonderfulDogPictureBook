class Public::DogBreedsController < ApplicationController
  def index
    @genres = Genre.all
    @dog_breeds = DogBreed.all.page(params[:page]).per(8)
  end

  def show
    @genres = Genre.all
    @dog_breeds = DogBreed.all
    @dog_breed = DogBreed.find(params[:id])
  end

  private
  def dog_breed_params
    params.require(:dog_breed).permit(:genre_id, :dog_image, :dog_name, :dog_introduction)
  end
end
