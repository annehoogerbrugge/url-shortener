class CreateShortenedUrls < ActiveRecord::Migration[7.1]
  def change
    create_table :shortened_urls do |t|
      t.string :long_url, null: false
      t.string :unique_code, null: false

      t.timestamps
    end
  end
end
