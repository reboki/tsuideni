class Message < ApplicationRecord

  validates :message, presence: true
  has_many :notifications, dependent: :destroy
  belongs_to :customer
  belongs_to :room
end
