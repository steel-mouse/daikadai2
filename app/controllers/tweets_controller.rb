class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end

  def create
   @tweet = Tweet.new(tweet_params)
    if @tweet.save
     redirect_to tweets_path, notice: "呟きました"
    else
      render'new'
    end

  end

  def show
   @tweet = Tweet.find(params[:id])
  end


  def edit
   @tweet = Tweet.find(params[:id])
  end

  def update
   @tweet = Tweet.find(params[:id])
   if @tweet.update(tweet_params)
     redirect_to tweets_path, notice: "呟きを編集しました！"
   else
     render 'edit'
   end
   
  end
  private

  def tweet_params
    params.require(:tweet).permit(:cotent)
  end
end
