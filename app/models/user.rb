class User < ApplicationRecord
  has_secure_password
  before_validation :downcase_nickname
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true
  validates :nickname, uniqueness: true, format: { with: /[a-z+0-9_]/ }, length: { maximum: 40 }
  def downcase_nickname
    nickname.downcase!
  end

end
