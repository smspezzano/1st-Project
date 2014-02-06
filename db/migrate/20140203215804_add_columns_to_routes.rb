class AddColumnsToRoutes < ActiveRecord::Migration
  def change
  	add_column :routes, :end, :string
  	add_column :routes, :roadGradeStrategy, :string
  end
end
