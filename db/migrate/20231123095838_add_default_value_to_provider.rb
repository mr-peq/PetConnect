class AddDefaultValueToProvider < ActiveRecord::Migration[7.1]
  def change
    change_column_default :users, :provider, from: nil, to: false
  end
end
