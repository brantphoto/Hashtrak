class RelatedHashtagsController < ApplicationController
  before_action :get_hashtag_feed
  
  def index
    @posts = @hashtag_feed.posts
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

  def show
  @related_hashtags = render json: RelatedHashtag.all
  end

  private 
  def get_hashtag_feed
    @hashtag_feed = HashtagFeed.find(params[:hashtag_feed_id])
  end

 
end
