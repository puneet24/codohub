class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :user_id,   :null=>false
      t.string :name
      t.text :statement
      t.text :input_format
      t.text :output_format
      t.text :constraints
      t.text :smaple_input
      t.text :sample_output
      t.integer :time_limit
      t.integer :memory_limit
      t.integer :source_limit
      t.string :difficuilty_level
      t.integer :no_of_attempts
      t.integer :no_of_solved
      t.integer :no_of_comments
      t.timestamps
    end
  end
end
