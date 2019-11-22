class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :sweet

  validates :text, presence: true
end
