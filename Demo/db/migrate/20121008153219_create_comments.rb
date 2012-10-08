class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.integer :commentable_id
      t.string :commentable_type

      t.timestamps
    end
  end
end
