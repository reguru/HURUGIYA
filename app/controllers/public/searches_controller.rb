class Public::SearchesController < ApplicationController
  before_action :authenticate_user!
  
  # def search 
  #   @posts = Post.looks(params[:word]) 
  #   #@posts = Tag.find(params[:tag_id]).posts
  # end
  
end
