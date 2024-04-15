# frozen_string_literal: true

FactoryBot.define do
    factory :shortened_url do
      long_url { Faker::Internet.url }
      unique_code { SecureRandom.base58(8) }
    end
  end