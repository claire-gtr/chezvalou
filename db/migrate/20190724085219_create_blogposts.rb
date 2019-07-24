class CreateBlogposts < ActiveRecord::Migration[5.2]
  def change
    create_table :blogposts do |t|

      t.timestamps
    end
  end
end
