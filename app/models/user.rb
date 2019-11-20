class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :sweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_sweets, through: :likes, source: :sweet  # userがどの投稿をいいねしているのかを取得

  def already_liked?(sweet)
    self.likes.exists?(sweet_id: sweet.id)
  end
end
