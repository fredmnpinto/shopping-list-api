class AddGroupIdColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :group, index: true
  end
end
