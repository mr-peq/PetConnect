class CreateServices < ActiveRecord::Migration[7.1]
  def change
    create_table :services do |t|
      t.string :type
      t.string :description
      t.float :price
      t.string :availabilities

      t.timestamps
    end
  end
end
