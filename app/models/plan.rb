class Plan < ApplicationRecord
  belongs_to :user, dependent: :destroy

  validates :title, presence: true
  validates :start_date, presence: true
end
