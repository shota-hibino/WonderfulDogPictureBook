class Public::FavoritesController < ApplicationController
  def create
    @comment = Comment.find(params[:comment_id])
    @favorite = current_member.favorites.new(comment_id: comment.id)
    @favorite.member_id = current_member.id
    @favorite.dog_breed_id = DogBreed.find(params[:dog_breed_id])
    @favorite.comment_id = @comment.id
    @favorite.save
    redirect_to public_dog_breed_path(params[:dog_breed_id])
  end

  def destroy
    @comment = Comment.find(params[:comment_id])
    @favorite = current_member.favorites.find_by(comment_id: comment.id)
    @favorite.member_id = current_member.id
    @favorite.dog_breed_id = DogBreed.find(params[:dog_breed_id])
    @favorite.comment_id = @comment.id
    @favorite.save
    redirect_to public_dog_breed_path(params[:dog_breed_id])
  end
end
