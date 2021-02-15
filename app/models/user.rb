class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A\S+@\S+\.\S+\z/ }
  validates :encrypted_password, presence: true, length: { minimum: 6 }, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ }
  validates :lastname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :firstname, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
  validates :lastname_reading, presence: true, format: { with: /\A([ァ-ン]|ー)+\z/ }
  validates :firstname_reading, presence: true, format: { with: /\A([ァ-ン]|ー)+\z/ }
  validates :birthday, presence: true
end