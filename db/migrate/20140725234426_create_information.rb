class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.string :message
      t.integer :disp_flag

      t.timestamps
    end
  end
end
