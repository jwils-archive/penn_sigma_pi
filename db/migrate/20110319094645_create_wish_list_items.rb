class CreateWishListItems < ActiveRecord::Migration
  def self.up
    create_table :wish_list_items do |t|
      t.string :name
      t.text :description
      t.string :picture
      t.decimal :price
      t.decimal :raised

      t.timestamps
    end
  end

  def self.down
    drop_table :wish_list_items
  end
end
