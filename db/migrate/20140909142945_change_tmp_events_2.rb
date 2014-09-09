class ChangeTmpEvents2 < ActiveRecord::Migration
  def change
    remove_column :tmp_events, :tag, :string
    add_column :tmp_events, :address, :string
  end
end
