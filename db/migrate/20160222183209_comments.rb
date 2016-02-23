class Comments < ActiveRecord::Migration
  def change
  	create_table :comments do |t|
  		t.string :content, null: false
  		t.integer :likes, default: 0

  		t.timestamps null: false
  	end
  end
end
