class CommentsController < ApplicationController
  before_filter :load_user

  def index
    @comment = Comment.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @comment = @user.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to users_path, notice: "Comment saved!"
    else
      render 'users/show'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, :user_id, :tag_id) #or :tag_list??
  end

  def load_user
    @user = User.find(params[:user_id])
  end
end