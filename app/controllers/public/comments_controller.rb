class Public::CommentsController < ApplicationController
  def create
    @dog_breed = Dogbreed.find(params[:dog_breed_id])
    @comment = Comment.new(comment_params)
    @comment.member_id = current_member.id
    @comment.save
    redirect_to  public_dog_breeds_path(@dog_breed)
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
