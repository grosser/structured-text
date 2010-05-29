class CreateModels < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name, :null => false
      t.string :email
      t.timestamps
    end
    add_index :users, :name, :unique => true

    create_table :rpx_identifiers do |t|
      t.string :identifier, :null => false
      t.integer :user_id, :null => false
      t.text :raw
    end
    add_index :rpx_identifiers, :identifier, :unique => true

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
