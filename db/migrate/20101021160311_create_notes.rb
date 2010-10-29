class CreateNotes < ActiveRecord::Migration
  def self.up
    create_table :notes do |t|
      t.string :note, :null => false, :limit => 4.kilobytes
      t.string :note_type, :limit => 50, :default => 'general'
      t.references :user
      t.references :contact

      t.timestamps
    end
    [:user_id,:contact_id, :note_type].each do |col|
      add_index :notes, col
    end

  end

  def self.down
    drop_table :notes
  end
end