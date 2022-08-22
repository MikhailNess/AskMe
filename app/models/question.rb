class Question < ApplicationRecord
  validates :body, presence: true, length:{maximum: 2}
end
