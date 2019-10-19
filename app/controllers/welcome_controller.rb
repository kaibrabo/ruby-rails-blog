class WelcomeController < ApplicationController
  def index
    @topics = Topic.all
  end

  def about
  end

  def contact
  end

  def faq
  end
end
