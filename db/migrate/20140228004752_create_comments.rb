class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :parent_comment_id
      t.integer :link_id
      t.integer :author_id
      t.text :text

      t.timestamps
    end
  end
end
