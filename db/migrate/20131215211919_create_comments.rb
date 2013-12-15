class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :wiki

      t.timestamps
    end
    add_index :comments, :wiki_id
  end
end
