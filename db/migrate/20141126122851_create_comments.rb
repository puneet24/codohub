class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
   	  t.string :user_id,:default=>false
      t.string :problem_id,:default=>false
      t.text :comment
      t.integer :rating,:default=>0
      t.timestamps
    end
  end
end
