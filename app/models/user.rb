class User < ApplicationRecord
  has_secure_password
  has_many :questions, dependent: :delete_all

  before_validation :downcase_nickname
  validates :email,
            format: {
              with: URI::MailTo::EMAIL_REGEXP
            },
            presence: true,
            uniqueness: true
  validates :nickname,
            uniqueness: true,
            format: {
              with: /\A[a-zA-Z0-9_]+\Z/
            },
            length: {
              maximum: 40
            }
  validates :color_preferences,
            presence: true,
            allow_nil: true,
            format: {
              with: /\A#\w{6}/i
            }

  private

  def downcase_nickname
    nickname&.downcase!
    color_preferences&.downcase!
    email&.downcase!
  end
end
