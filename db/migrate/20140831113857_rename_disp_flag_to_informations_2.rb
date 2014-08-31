class RenameDispFlagToInformations2 < ActiveRecord::Migration
  def change
    rename_column :information, :disp_flag, :disable
  end
end
