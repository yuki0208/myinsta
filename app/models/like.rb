class Like < ApplicationRecord
  belongs_to :photopost, counter_cache: :likes_count
  belongs_to :user
end
