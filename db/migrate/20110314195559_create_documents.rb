class CreateDocuments < ActiveRecord::Migration
  def self.up

    create_table :documents do |t|
      t.string :name, :limit => 255
      t.string :document_type, :limit => 50
      t.string :description, :limit => 4.kilobytes
      t.string :file_attachment, :null => false
      t.references :user
      t.references :contact
      t.timestamps
    end

    [:user_id,:contact_id, :document_type, :file_attachment].each do |col|
      add_index :documents, col
    end

  end

  def self.down
    drop_table :documents
  end
end
