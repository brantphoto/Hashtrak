class Search < ActiveRecord::Base
  belongs_to :hashtag_feed

  validates :topic, presence: true
  validates :hashtag_feed_id, presence: true
end
