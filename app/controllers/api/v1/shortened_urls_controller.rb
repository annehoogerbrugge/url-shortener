# frozen_string_literal: true

module Api
  module V1
    class ShortenedUrlsController < ApplicationController
      include ShortenedUrlsHelper
      
      def create
        @shortened_url = ShortenedUrl.find_or_create_by(long_url: shortened_url_params[:long_url])
        render json: ::ShortenedUrlSerializer.new(@shortened_url).serialize
      end

      # redirect to long redirect based on the unique_code
      def show
        @shortened_url = show_cache(params[:unique_code])
        redirect_to @shortened_url.long_url, allow_other_host: true
      end

      private

      def shortened_url_params
        params.require(:shortened_url).permit(:long_url, :unique_code)  
      end
    end
  end
end
