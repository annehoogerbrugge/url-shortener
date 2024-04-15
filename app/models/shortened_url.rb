# frozen_string_literal: true

class ShortenedUrl < ApplicationRecord
  validates :long_url, url: true
  validates_uniqueness_of :unique_code

  before_create :generate_unique_code

  MAX_RETRIES = 3

  def redirect_url
    Rails.application.routes.url_helpers.api_v1_redirect_url_url(unique_code: self.unique_code)
  end

  private

  def generate_unique_code
    unless unique_code
      retries = 0
      loop do
        retries += 1
        break if retries > MAX_RETRIES
        self.unique_code = SecureRandom.base58(8)
        break unless self.class.find_by(unique_code: unique_code)
      end
    end
  end
end