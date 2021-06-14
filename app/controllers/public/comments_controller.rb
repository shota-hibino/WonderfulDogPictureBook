class Public::CommentsController < ApplicationController
  def create
    @dog_breed = DogBreed.find(params[:dog_breed_id])
    @comment = Comment.new(comment_params)
    @comment.member_id = current_member.id
    @comment.dog_breed_id = @dog_breed.id
    @comment.save!
    redirect_to  public_dog_breeds_path(@dog_breed)
  end

  def destroy
    Comment.find_by(id: params[:id], dog_breed_id: params[:dog_breed_id]).destroy
    redirect_to public_dog_breed_path(params[:dog_breed_id])
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
