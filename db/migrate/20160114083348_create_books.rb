class CreateBooks < ActiveRecord::Migration

  def self.up
    create_table :books do |t|
      t.string :name, default: nil, null: false, unique: true
      t.text :description
      t.string :cover_image
      t.timestamp :create_at
    end
  end

  def self.down
    drop_table :books
  end

end
