class User < ApplicationRecord
  has_secure_password
  before_save :downcase_nickname
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :nickname, uniqueness: true, length: { maximum: 40 }
  validates_format_of :nickname, with: /^[a-z+0-9\d_]+$/, multiline: true

  def downcase_nickname
    nickname.downcase!
  end

end
