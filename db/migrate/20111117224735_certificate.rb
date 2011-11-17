class Certificate < ActiveRecord::Migration
  def self.up
    create_table :certificates do |t|
      t.string :file_path
      t.references :registration
      t.timestamps
    end
  end

  def self.down
    drop_table :certificates
  end
end
