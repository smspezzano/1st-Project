class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :link

      t.timestamps
    end
  end
end
