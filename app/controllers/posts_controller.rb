class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]
    
    if @post.save
      puts "****Post was saved"
      flash[:notice] = "Post was saved"
      redirect_to @post
    else
      flash.now[:alert] = "There was something wrong, try again?"
      render :new
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
  end
end
