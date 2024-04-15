# frozen_string_literal: true

module ShortenedUrlsHelper
  def show_cache(unique_code)
    @shortened_url = Rails.cache.fetch unique_code do
      ShortenedUrl.find_by(unique_code:)
    end
  end
end