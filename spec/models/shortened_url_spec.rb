# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ShortenedUrl, type: :model do
  
  describe 'new shortened url' do
    let(:shortened_url) { create(:shortened_url) }
  
    context 'succeeds' do
      it { expect(shortened_url).to be_valid }
    end

    context 'failure' do
      it 'is not valid without a long_url' do
        shortened_url.long_url = nil
        expect(shortened_url).to_not be_valid
      end

      it 'is not valid with a duplicate unique_code' do
        shortened_url2 = build(:shortened_url, unique_code: shortened_url.unique_code)
        expect(shortened_url2).to_not be_valid
      end

      it 'is not valid with a too short url' do
        shortened_url.long_url = 'https://short.com'
        expect(shortened_url).to_not be_valid
        expect(shortened_url.errors.messages[:long_url]).to eq ['The url does not have the correct length']
      end

      it 'is not valid with a wrong format' do
        shortened_url.long_url = 'abc://my_long_not_valid_url.com'
        expect(shortened_url).to_not be_valid
        expect(shortened_url.errors.messages[:long_url]).to eq ['This is not a valid url']
      end
    end
  end
end
