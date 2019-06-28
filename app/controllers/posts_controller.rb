class PostsController < ApplicationController
	# Posts index on each Topic

	def new
		@topic = Topic.find(params[:topic_id])	# associating topic_id to post
		@post = Post.new
	end

	def create
		@topic = Topic.find(params[:topic_id])
		@post = Post.new

		@post.title = params[:post][:title]
		@post.body = params[:post][:body]
		@post.topic = @topic

		if @post.save
			flash[:notice] = "Post was saved successfully" 
			redirect_to [@topic, @post]
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
			flash[:notice] = "Topic was saved successfully" 
			redirect_to [@post.topic, @post]
		else
			flash.now[:alert] = "There was something wrong, try again?"
			render :edit
		end
	end

	def destroy
		@post = Post.find(params[:id])

		if @post.destroy
			flash[:notice] = "#{@post.title} was deleted successfully"
			redirect_to @post.topic
		else
			flash.now[:alert] = "There was something wrong, try again?"
			render :show
		end
	end
end
