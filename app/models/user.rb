class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, presence: true, length: { minimum: 6 }, format: { with: PASSWORD_REGEX}

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
    validates :last_name, presence: true
    validates :first_name, presence: true
  end

  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/ } do
    validates :last_name_kana, presence: true
    validates :first_name_kana, presence: true
  end

  validates :birthday, presence: true

end
