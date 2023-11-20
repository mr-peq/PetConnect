class ChangeTypeToProvider < ActiveRecord::Migration[7.1]
  def change
    rename_column :users, :type, :provider
  end
end
