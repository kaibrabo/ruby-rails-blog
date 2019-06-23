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
			redirect_to @topic, notice: "Post was saved successfully" 
		else
		  flash.now[:alert] = "There was something wrong, try again?"
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
		@post = Post.find(params[:id])
		@post.title = params[:post][:title]
		@post.body = params[:post][:body]

	if @post.save
    redirect_to @topic, notice: "Topic was saved successfully" 

	else
		flash.now[:alert] = "There was something wrong, try again?"
		render :edit
	end
  end

  def destroy
		@post = Post.find(params[:id])
	
		if @post.destroy
			flash[:notice] = "#{@post.title} was deleted successfully"
			redirect_to posts_path
		else
			flash.now[:alert] = "There was something wrong, try again?"
			render :show
		end
  end
end
