class CreateUsers < ActiveRecord::Migration[7.0]
  enable_extension 'pgcrypto' unless extension_enabled?('pgcrypto')
  def change
    create_table :users, id: :uuid do |t|
      t.string :email
      t.string :username
      t.string :location
      t.string :password_digest

      t.timestamps
    end
  end
end
