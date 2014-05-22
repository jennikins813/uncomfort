class CommentsController < ApplicationController
  before_filter :load_user

  def index
    @comment = Comment.new
  end

  def show
    @user = User.find(params[:id])
  end



  # Parameters: {"utf8"=>"✓", "authenticity_token"=>"1FywcPVAOJULgNgyPUwR6QRtGVPBIJjPyk6aCQ+YGJA=", "comment"=>{"comment"=>"Hi Bunny!\r\n"}, "commit"=>"Create Comment", "user_id"=>"2"}

  # This is what's happening, from above.
  # params[:utf8]
  # params[:authenticity_token]
  # params[:user_id]  # WRONG

  # params[:comment][:comment]
  # params[:comment][:user_id]  #CORRECT
  # params[:comment][:tag_id]

  def create
    @comment = @user.comments.build(comment_params)
    @comment.commenter_id = current_user.id   # this is the person that is making the comment, ie. the logged in person.

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