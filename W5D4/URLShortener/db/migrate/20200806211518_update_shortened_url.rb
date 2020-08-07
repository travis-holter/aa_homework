class UpdateShortenedUrl < ActiveRecord::Migration[6.0]
  def change
  end
  add_index :shortened_urls, :short_url, unique: true
  
end
