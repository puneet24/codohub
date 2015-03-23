class AddColumnToGroups < ActiveRecord::Migration
  def change
  	add_column :groups,:no_of_members,:integer,:default=>1
  end
end
