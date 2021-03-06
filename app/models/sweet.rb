class Sweet < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user  # 投稿がどのuserにいいねされているのかを取得

  validates :title, :image, :visit_day, :shop_name, :shop_area, :menu, :rate, :comment, presence: true
end
