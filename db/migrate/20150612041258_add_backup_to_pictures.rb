class AddBackupToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :backup, :string
  end
end
