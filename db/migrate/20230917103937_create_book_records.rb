class CreateBookRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :book_records do |t|
      t.string :title
      t.text :content
      t.string :author
      t.string :author_address
      t.integer :price
      t.string :book_id

      t.timestamps
    end
  end
end
