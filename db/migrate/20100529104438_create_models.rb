class CreateModels < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :identifier, :email, :name, :null => false
    end
    add_index :users, :email, :unique => true
    add_index :users, :name, :unique => true
    add_index :users, :identifier, :unique => true

    create_table :documents do |t|
      t.integer :user_id, :null => false
      t.string :title, :null => false
      t.timestamps
    end

    create_table :sections do |t|
      t.string :title
      t.text :text
      t.string :ancestry
      t.timestamps
    end
    add_index :sections, :ancestry
  end

  def self.down
    drop_table :sections
    drop_table :users
    drop_table :documents
  end
end
