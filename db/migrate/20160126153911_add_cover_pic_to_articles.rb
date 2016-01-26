class AddCoverPicToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :cover_pic, :string
  end
end
