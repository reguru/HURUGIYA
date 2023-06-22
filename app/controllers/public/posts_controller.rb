class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :guest_check ,except: [:show,:index]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to root_path, notice: "自分の投稿以外は編集できません。"
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def index
    if params[:tag_id].present?
      @posts = Tag.find(params[:tag_id]).posts.order(created_at: :desc).page(params[:page])
    else
      @posts = Post.looks(params[:word]).order(created_at: :desc).page(params[:page])
    end
  end

  def map
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:name,:address,:introduction,:twitter,:facebook,:instagram, image:[], tag_ids:[], shop_tag_ids:[])
  end

  def guest_check
    if current_user.name == "ゲスト"
      redirect_to root_path, notice: 'このページを見るには会員登録が必要です。'
    end
  end

end
