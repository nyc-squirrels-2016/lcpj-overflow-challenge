class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.text :body, null: false
    	t.integer :commentable_id
    	t.string :commentable_type
    	t.references :user, index: true, null: false
    	t.timestamps null: false
    end
  end
end
