class AddDefaultFalseToItemsIsChecked < ActiveRecord::Migration[7.0]
  def change
    change_column :items, :is_checked, :boolean, default: false
  end
end
