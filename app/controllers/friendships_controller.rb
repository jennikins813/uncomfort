class FriendshipsController < ApplicationController
  def create
  	@friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = "Added friend!"
      redirect_to current_user
    else
      flash[:alert] = "No friends for you"
      redirect_to users
    end
  end

  def destroy
  	@friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friend."
    redirect_to current_user
  end

end
