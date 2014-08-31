class RelatedHashtagsController < ApplicationController
  before_action :get_hashtag_feed
  
  def index
    @posts = @hashtag_feed.posts
    @array = []
    @posts.each do |x|
      x.related_hashtags.each do |y|
        @array.push(y)
      end
    end
    @array = @array.uniq
    @hashtag_feeds = HashtagFeed.all
  end

  def new
  end

  def create

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 
  def get_hashtag_feed
    @hashtag_feed = HashtagFeed.find(params[:hashtag_feed_id])
  end

 
end
