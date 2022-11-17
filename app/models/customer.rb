class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :kana_last_name, presence: true
  validates :kana_first_name, presence: true
  validates :email, presence: true
  validates :zipcode, presence: true, numericality: { only_integer: true}, length:{ minimum: 7, maximum: 7}
  validates :address, presence: true
  validates :phone_number, presence: true, numericality: { only_integer: true}, length:{ minimum: 11, maximum: 11}
end
