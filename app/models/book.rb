class Book < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true, length:{ maximum: 200 }
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
