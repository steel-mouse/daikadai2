class TweetsController < ApplicationController
  def index
  end

  def new
    @tweet = Tweet.new
  end

  def create
   Tweet.create(content: params[:tweet][:content])
   redirect_to new_tweet_path
  end
end
