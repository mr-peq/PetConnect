class ChangeServiceTypeToTitle < ActiveRecord::Migration[7.1]
  def change
    rename_column :services, :type, :title
  end
end
