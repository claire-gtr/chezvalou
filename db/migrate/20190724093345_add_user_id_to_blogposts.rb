class AddUserIdToBlogposts < ActiveRecord::Migration[5.2]
  def change
    add_column :blogposts, :user_id, :integer
  end
end
