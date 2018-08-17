class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :genre
      t.string :sub_genre
      t.integer :num_of_pages
      t.string :publisher

      t.timestamps
    end
  end
end
