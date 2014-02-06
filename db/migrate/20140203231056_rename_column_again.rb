class RenameColumnAgain < ActiveRecord::Migration
  def change
  	rename_column :routes, :start, :startLocation
  	rename_column :routes, :end, :endLocation
  end
end
