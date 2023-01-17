class Public::PostsController < ApplicationController
  before_action :authenticate_user!
  #before_action :guest_check ,except: [:show,:index]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to post_path(@post.id)
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post.id)
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

  end

  private

  def post_params
    params.require(:post).permit(:name,:address,:introduction, image:[], tag_ids:[])
  end
end
