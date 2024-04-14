class AddIndexToShortenedUrls < ActiveRecord::Migration[7.1]
  def change
    add_index :shortened_urls, :long_url
    add_index :shortened_urls, :unique_code, unique: true
  end
end
