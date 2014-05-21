class CommentsController < ApplicationController
	before_filter :load_user, :load_commenter_id


  def show
  	@user = User.find(params[:id])
  end

  def create
    @comment = @commenter_id.comments.new(comment_params)
    if @comment.save
      redirect_to @commenter_id, notice: "Comment created!"
    else
      render 'users/show'
    end
  	# @comment = @user.comments.build(comment_params)
  	# @comment.user_id = current_user.id

  	# if @comment.save
  	# 	redirect_to users_path, notice: "Comment saved!"
  	# else
  	# 	render 'users/show'
  	# end
  end

  def destroy
  	@comment = Comment.find(params[:id])
  	@comment.destroy
  end

  private
  def comment_params
  	params.require(:comment).permit(:comment, :user_id, :tag_id, :commenter_id) #or :tag_list??
  end

  def load_user
    @user = User.find(params[:user_id])
  end

  def load_commenter_id
    resource, id = request.path.split('/')[1, 2] 
    @commenter_id = resource.singularize.classify.constantize.find(id)
  end
end
