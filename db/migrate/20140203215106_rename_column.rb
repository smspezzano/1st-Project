class RenameColumn < ActiveRecord::Migration
  def change
  	rename_column :routes, :link, :start
  end
end
