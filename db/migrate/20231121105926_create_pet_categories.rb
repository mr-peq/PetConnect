class CreatePetCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :pet_categories do |t|
      t.string :pet_category

      t.timestamps
    end
  end
end
