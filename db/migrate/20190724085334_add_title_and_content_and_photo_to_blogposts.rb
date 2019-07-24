class AddTitleAndContentAndPhotoToBlogposts < ActiveRecord::Migration[5.2]
  def change
    add_column :blogposts, :title, :string
    add_column :blogposts, :content, :text
    add_column :blogposts, :photo, :string
  end
end
