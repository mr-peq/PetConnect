class CreateServicePetCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :service_pet_categories do |t|
      t.references :pet_category, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true

      t.timestamps
    end
  end
end
