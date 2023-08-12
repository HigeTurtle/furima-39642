class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  valid_name = /\A[ぁ-んァ-ヶ一-龥々ー]/
  valid_name_kana = /\A[ァ-ヶー－]+\z/
  valid_passeord = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  

  validates :nickname, presence: true
  validates :password, format: { with: valid_passeord }
  validates :first_name, presence: true, format: { with: valid_name }
  validates :last_name, presence: true, format: { with: valid_name }
  validates :first_name_kana, presence: true, format: { with: valid_name_kana }
  validates :last_name_kana, presence: true, format: { with: valid_name_kana }
  validates :birthday, presence: true

  
  

  

end
