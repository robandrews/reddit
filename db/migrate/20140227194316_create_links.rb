class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.string :url, :length => 1024
      t.text :text
      t.integer :submitter_id

      t.timestamps
    end
  end
end
