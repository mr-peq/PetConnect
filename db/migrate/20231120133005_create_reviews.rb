class CreateReviews < ActiveRecord::Migration[7.1]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :booking, null: false, foreign_key: true
      t.text :description
      t.integer :rating

      t.timestamps
    end
  end
end
