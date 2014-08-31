class SearchesController < ApplicationController
  def index
  end

  def new
  	@search = Search.new
  end

  def create
    @search = Search.new(params.require(:search).permit(:topic))
    if @search.save
      recentposts(@search.topic)
      redirect_to hashtag_feed_related_hashtags_path(@y.id)
    else
      respond_to do |format|
        format.html { render action: 'new' }
        format.json { render json: @search.errors, status: :unprocessable_entity }
      end
    end
  end

  def recentposts(hashfeed)

    presponse = HTTParty.get("https://api.instagram.com/v1/tags/#{hashfeed}?client_id=e7e5e08b2c444bf5a395ff0d1e5427be")
    parsedobj1 = JSON.parse(presponse.body)
    sizer = parsedobj1['data']['media_count']
    namer = parsedobj1['data']['name']
    if HashtagFeed.exists?(:name => namer)
      @y = HashtagFeed.where(:name => namer).first
      HashSize.create(size:sizer, hashtag_feed: @y)
    else 
      @y = HashtagFeed.create(name: namer)
      HashSize.create(size: sizer, hashtag_feed: @y)
    end

    response = HTTParty.get("https://api.instagram.com/v1/tags/#{hashfeed}/media/recent?client_id=e7e5e08b2c444bf5a395ff0d1e5427be")
    parsedobjs = JSON.parse(response.body)
    datar = parsedobjs['data']
    for i in datar do
      tags = i['tags']
      id = i['id']
      date = i['created_time']
      location = i['location']
      p = Post.create(hashtags:tags, instagram_id:id, created_time:date, hashtag_feed:@y)
      relate_to_tag(p)
    end
  end

  def relate_to_tag(pozt)
    array = pozt.hashtags
    array.each do |t|
     if RelatedHashtag.exists?(:name => t)
       x = RelatedHashtag.where(:name => t).first
       RelatedHashtagPost.create(related_hashtag:x, post:pozt)
     else
       x = RelatedHashtag.create(name:t)
       RelatedHashtagPost.create(related_hashtag:x, post:pozt)
     end
   end
 end


 def destroy
 end 
end
