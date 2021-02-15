class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :email, uniqueness: true, format: { with: /\A\S+@\S+\.\S+\z/ }
    validates :password, length: { minimum: 6 }, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ }

    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/ } do
      validates :lastname
      validates :firstname
    end

    with_options format: { with: /\A([ァ-ン]|ー)+\z/ } do
      validates :lastname_reading
      validates :firstname_reading
    end
  end
end
