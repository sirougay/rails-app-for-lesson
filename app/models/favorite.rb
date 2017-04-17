class Favorite < ActiveRecord::Base
  belongs_to :tweet
  belongs_to :user
  validates :tweet, presence: true
  validates :user, presence: true
  validates :user_id, uniqueness:{ scope: :tweet_id }


end
