class User < ApplicationRecord
  has_secure_password # password_confirmationカラムが作成される
  
  # 空でないこと
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true # 一意性制約
  # 関連付け
  has_many :dream_lists, dependent: :destroy
  has_many :plans, dependent: :destroy
end
