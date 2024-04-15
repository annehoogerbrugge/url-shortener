# frozen_string_literal: true

class ShortenedUrlSerializer
  include Alba::Resource

  root_key :shortened_url

  attributes :id, :long_url, :unique_code, :created_at, :updated_at

  attribute :redirect_url do |resource|
    resource.redirect_url
  end
end
