class DreamList < ApplicationRecord

  #空でないこと
  validates :dream, presence: true
  validates :period, presence: true
  validates :category, presence: true

  # ActiveStrage
  has_one_attached :image

  def get_image
   (image.attached?) ? image : "dummy.png"
  end
end
