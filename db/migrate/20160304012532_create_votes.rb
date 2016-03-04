class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
    	t.integer :direction_value, null: false
    	t.integer :votable_id
    	t.string :votable_type
      t.references :user

    	t.timestamps null: false
    end
  end
end
