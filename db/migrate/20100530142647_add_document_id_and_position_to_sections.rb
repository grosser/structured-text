class AddDocumentIdAndPositionToSections < ActiveRecord::Migration
  def self.up
    remove_column :sections, :ancestry
    add_column :sections, :document_id, :integer, :null => false, :default => -1
    change_column :sections, :document_id, :integer, :default => nil
    add_index :sections, :document_id

    add_column :sections, :position, :integer, :null => false, :default => -1
    change_column :sections, :position, :integer, :default => nil
    add_index :sections, :position

    add_column :sections, :parent_id, :integer
    add_index :sections, :parent_id
  end

  def self.down
  end
end
