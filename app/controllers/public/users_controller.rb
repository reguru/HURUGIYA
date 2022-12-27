class Public::UsersController < ApplicationController
  
  def show
    @user = current_user
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    @user.update(user_params)
    redirect_to users_mypage_path
  end
  
  def quit
  
  end
  
  def quit_update
    
  end
  
  def index
    @user_posts = current_user.posts.all
  end
  
  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end
  
  private
  def user_params
    params.require(:user).permit(:name,:email,:profile_image)
  end
end
