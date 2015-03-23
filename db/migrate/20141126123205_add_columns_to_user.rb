class AddColumnsToUser < ActiveRecord::Migration
  def change
  	add_column :users,:first_name , :string
  	add_column :users,:last_name , :string
  	add_column :users,:college , :string
  	add_column :users,:languages_known , :string
  	add_column :users,:no_of_followers , :integer,:default=>0
  	add_column :users,:no_of_following , :integer,:default=>0
  	add_column :users,:phone_no,:string
  	add_column :users,:problems_accepted,:integer,:default=>0
  	add_column :users,:total_submissions,:integer,:default=>0
  	add_column :users,:wrong_submissions,:integer,:default=>0
  	add_column :users,:compile_count,:integer,:default=>0
  	add_column :users,:runtime_count,:integer,:default=>0
  	add_column :users,:tle_count,:integer,:default=>0
  	add_column :users,:user_type,:string,:default=>"GENERAL"
  end
end