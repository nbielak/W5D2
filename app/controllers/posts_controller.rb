class PostsController < ApplicationController
  before_action :require_login, only: [:new, :create, :edit, :update]
  
  def new
    @post = Post.new
  end 
  
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :new 
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit 
    @post = Post.find(params[:id])
  end 
  
  def update 
    @post = current_user.posts.find(params[:id])
    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash[:errors] = @post.errors.full_messages
      render :edit
    end
  end 
  
  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end 
  
  private 
  
  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
end