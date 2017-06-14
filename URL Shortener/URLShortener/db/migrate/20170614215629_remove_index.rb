class RemoveIndex < ActiveRecord::Migration[5.0]
  def change
    remove_index :shortened_urls, :user_id
  end
end
