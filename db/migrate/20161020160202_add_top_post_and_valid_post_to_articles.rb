class AddTopPostAndValidPostToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :top_post, :boolean
    add_column :articles, :valid_post, :boolean
  end
end
