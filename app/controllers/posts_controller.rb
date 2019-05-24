class PostsController < ApplicationController
  before_action :load_post, only: [:show, :edit, :update, :destroy]
  
  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    
    if @post.save
      flash[:success] = "게시물 저장에 성공하였습니다."
      redirect_to post_path(@post)
    else
      flash[:danger] = "게시물 저장에 실패하였습니다."
      redirect_to new_post_path
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      redirect_to edit_post_path
    end
  end
  

  def destroy
    if @post.destroy 
      flash[:success] = "게시물 삭제에 성공하였습니다."
    else
      flash[:danger] = "게시물 삭제에 실패하였습니다."
    end
    redirect_to posts_path
  end
  
  private
  def load_post
    @post = Post.find(params[:id])
  end
  def post_params
    params.require(:post).permit(:title, :content, :subtitle)
  end
  
end
