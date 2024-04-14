# frozen_string_literal: true

class ShortenedUrl < ApplicationRecord
  # validates :url, format: URI::regexp(%w[http https])
  # validates_uniqueness_of :slug
end