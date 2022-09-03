class User < ApplicationRecord
  has_secure_password
  has_many :questions, dependent: :delete_all
  has_many :asked_questions,
           class_name: "Question",
           foreign_key: :author_id,
           dependent: :nullify

  before_validation :downcase_attributes
  validates :name, presence: true
  validates :email,
            format: { with: URI::MailTo::EMAIL_REGEXP },
            presence: true,
            uniqueness: true
  validates :nickname,
            uniqueness: true,
            format: { with: /\A\w+\z/ },
            length: { maximum: 40 }
  validates :color_preferences,
            presence: true,
            allow_nil: true,
            format: { with: /\A#(\h{3}){1,2}\z/i }

  include Gravtastic
  gravtastic(secure: true, filetype: :png, size: 100, default: 'robohash')

  private

  def downcase_attributes
    nickname&.downcase!
    color_preferences&.downcase!
    email&.downcase!
  end
end
