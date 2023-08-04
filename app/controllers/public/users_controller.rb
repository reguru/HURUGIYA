class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :guest_check ,except: [:mypage]

  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts.page(params[:page])
  end

  def mypage
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
    @user = current_user
    @user.update!(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def index
    @user_posts = current_user.posts.page(params[:page])
  end

  def favorites
    @user = User.find(params[:id])
    favorited_post_ids = @user.favorites.pluck(:post_id)
    @favorite_posts = Post.where(id: favorited_post_ids).page(params[:page])
    unless @user == current_user
      redirect_to root_path, notice: "他のユーザーのいいね一覧は閲覧できません。"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,:email,:profile_image)
  end

  def guest_check
    if current_user.name == "ゲスト"
      redirect_to root_path, notice: 'このページを見るには会員登録が必要です。'
    end
  end

end
