class CreateCopies < ActiveRecord::Migration[5.2]
  def change
    create_table :copies do |t|
      t.boolean :available, default: true
      t.references :book, foreign_key: true

      t.timestamps
    end
  end
end
