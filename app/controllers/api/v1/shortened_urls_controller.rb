# frozen_string_literal: true

module Api
  module V1
    class ShortenedUrlsController < ApplicationController
      # include validator?

      #create new short url based on given long url
      def create
        # validate_long_url
        # if the url has already be shortened before find and return
        @shortened_url = ShortenedUrl.find_or_creat_by(long_url: shortened_url_params[:long_url])
        if @shortened_url.save
          render json: ShortenedUrlSerializer.new(@shortened_url).to_json
          @shortened_url
        else
          render json: @shortened_url.errors, status: :unprocessable_entity
        end
      end

      # redirect to long redirect based on the unique code given
      def show
        @shortened_url = ShortenedUrl.find_by(params[:unique_code])
        redirect_to url[@shortened_url.long_url], status: :moved_permanently
      end

      private

      def shortened_url_params
        params.require(:shortened_url).permit(:long_url)  
      end

    end
  end
end