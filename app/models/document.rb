class Document < ApplicationRecord
  LANGUAGES = %w[FR EN]

  validates :title, presence: true
  validates :language, presence: true, inclusion: { in: LANGUAGES }

  def validated?
    validation_at.present?
  end
end