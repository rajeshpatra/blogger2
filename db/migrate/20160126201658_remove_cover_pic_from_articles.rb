class RemoveCoverPicFromArticles < ActiveRecord::Migration
  def change
    remove_column :articles, :cover_pic, :string
  end
end
