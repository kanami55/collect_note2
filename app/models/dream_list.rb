class DreamList < ApplicationRecord
  # 空でないこと
  validates :dream, presence: true
  validates :countdown, presence: true
  validates :category, presence: true
  # 関連付け
  belongs_to :user

  # ActiveStrage
  has_one_attached :image

  def get_image
    (image.attached?) ? image : "dummy.png"
  end

  def self.search(search_word)
    DreamList.where(['category LIKE ?', "#{search_word}"]) # 完全一致のカテゴリー
  end
end
