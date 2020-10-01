class AddOmniauthToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users,  :uid,        :string, null: true
    add_column :users,  :avatar_url, :string, null: true
  end
end
