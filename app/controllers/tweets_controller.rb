class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]

  def index
    @tweets = Tweet.all
  end

  def new
    if params[:back]
     @tweet = Tweet.new(tweet_params)
   else
     @tweet = Tweet.new
   end
  end

  def create
   @tweet = Tweet.new(tweet_params)
    if @tweet.save
     redirect_to tweets_path, notice: "呟きました"
    else
      render 'new'
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

  def confirm
    @tweet = Tweet.new(tweet_params)
    render :new if @tweet.invalid?
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice:"呟きを削除しました！"
  end

private

  def tweet_params
    params.require(:tweet).permit(:content)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
