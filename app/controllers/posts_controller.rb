class PostsController < ApplicationController
	# Posts index on each Topic
	before_action :require_sign_in, except: :show

	def new
		@topic = Topic.find(params[:topic_id])	# associating topic_id to post
		@post = Post.new
	end

	def create
		@topic = Topic.find(params[:topic_id])
		@post = @topic.posts.build(post_params)

		@post.user = current_user

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
		@post.assign_attributes(post_params)

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

	private

	def post_params
		params.require(:post).permit(:title, :body)
	end
end
