class Like < ApplicationRecord
  belongs_to :user
  belongs_to :sweet, counter_cache: :likes_count
end
