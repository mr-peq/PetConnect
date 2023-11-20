class AddAddressToService < ActiveRecord::Migration[7.1]
  def change
    add_column :services, :address, :string
  end
end
