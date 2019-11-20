class Sweet < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user  # 投稿がどのuserにいいねされているのかを取得
end
