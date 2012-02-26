class TweetsController < ApplicationController
  def index
    @tweets = Tweet.find(:all, :limit => 50, :order => 'created_at desc')
  end

  def show
    @original = Tweet.find_by_id(params[:id])
    @tweets = @original.translations
  end
end
