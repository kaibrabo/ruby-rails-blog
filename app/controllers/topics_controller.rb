class TopicsController < ApplicationController

    before_action :require_sign_in, except: [:index, :show]
    before_action :authorize_member, except: [:index, :show]
    
    def index
        @topics = Topic.all
    end
    
    def show
        @topic = Topic.find(params[:id])
    end
    
    def new
        @topic = Topic.new
    end
    
    def create
        @topic = Topic.new(topic_params)
        
        if @topic.save
            redirect_to @topic, notice: "Topic was saved successfully" 
        else
            flash.now[:alert] = "There was something wrong, try again?"
            render :new
        end
    end
    
    def edit
        @topic = Topic.find(params[:id])
    end
    
    def update
        @topic = Topic.find(params[:id])
        
        @topic.assign_attributes(topic_params)
        
        if @topic.save
            redirect_to @topic, notice: "Topic was updated successfully"
        else
            flash.now[:alert] = "There was something wrong, try again?"
            render :edit
        end
    end
    
    def destroy
        @topic = Topic.find(params[:id])
        
        if @topic.destroy
            flash[:notice] = "#{@topic.name} was deleted successfully" 
            redirect_to action: :index # === topics_path
        else
            flash.now[:alert] = "There was something wrong, try again?"
            render :show
        end
    end

    private
    def topic_params
      params.require(:topic).permit(:name, :description, :public)
    end

    def authorize_member
        unless current_user.admin? || current_user.moderator?
            redirect_to topics_path, alert: "You do not have admin access!"
        end
    end

    # def authorize_moderator
    #     unless current_user.moderator?
    #         redirect_to topics_path
    #     end
    # end


end
