class ChangeEvents2 < ActiveRecord::Migration
  def change
    remove_column :events, :tag, :string
    add_column :events, :address, :string
  end
end
