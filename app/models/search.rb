class Search < ActiveRecord::Base
  belongs_to :hashtag_feed

  validates :name, presence: true
  validates :hashtag_feed_id, presence: true
end
