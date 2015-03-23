class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :user_id
      t.string :problem_id
      t.string :status
      t.float :execution_time
      t.integer :memory
      t.timestamps
    end
  end
end
