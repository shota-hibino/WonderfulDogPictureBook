class Public::CommentsController < ApplicationController
  before_action :authenticate_member!

  def create
    @dog_breed = DogBreed.find(params[:dog_breed_id])
    @comment = Comment.new(comment_params)
    @comment.member_id = current_member.id
    @comment.dog_breed_id = @dog_breed.id
    @comment.save
  end

  def destroy
    @dog_breed = DogBreed.find(params[:dog_breed_id])
    @comment = @dog_breed.comments.find(params[:id])
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
