class AddImageUrlToPosts < ActiveRecord::Migration[7.0]
  enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
  def change
    add_column :posts, :image_url, :text
  end
end
