class User < ApplicationRecord
  has_secure_password validations: true # password_confirmationカラムが作成される

  # 空でないこと
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true # 一意性制約
  # 関連付け
  has_many :dream_lists, dependent: :destroy
  has_many :plans, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :not_to_do_lists, dependent: :destroy
end
