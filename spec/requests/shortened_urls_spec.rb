require 'rails_helper'

RSpec.describe "ShortenedUrls", type: :request do

  describe 'POST/' do  
    scenario 'with validate attribute' do
      long_url = Faker::Internet.url
      post  "/api/v1/shortened_urls", params: { 
        shortened_url: {
            long_url:
        }
      }
    
      expect(response).to have_http_status(:success)
      shortened_url = JSON.parse(response.body)
      expect( shortened_url["shortened_url"]["long_url"]).to eq(long_url)
      expect(ShortenedUrl.count).to eq(1)
    end
  end
end