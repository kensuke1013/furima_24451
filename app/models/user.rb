class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


        with_options presence: true do

         validates :nickname
         validates :birth_day
         
         VALID_PASSWORD_REGEX =/\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/
         validates :password, length: { minimum: 6 }, confirmation: true, format:{ with: VALID_PASSWORD_REGEX}
         validates :password_confirmation

         with_options format: {with: /\A[ぁ-んァ-ン一-龥]/ } do
          validates :family_name             # ここがユーザー本名全角の正規表現
          validates :first_name              # ここがユーザー本名全角の正規表現
         end

         with_options format: {with: /\A[ァ-ヶー－]+\z/ } do
          validates :family_name_kana        # ここがフリガナ全角の正規表現
          validates :first_name_kana         # ここがフリガナ全角の正規表現
         end

         #validates :email,uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
        end
    end
