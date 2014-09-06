class ChangeEvents < ActiveRecord::Migration
  def change
    remove_column :events, :description, :string
    rename_column :events, :from_date, :started_at
    rename_column :events, :to_date, :ended_at
  end
end
