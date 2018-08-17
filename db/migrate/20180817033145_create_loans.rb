class CreateLoans < ActiveRecord::Migration[5.2]
  def change
    create_table :loans do |t|
      t.references :user, foreign_key: true
      t.references :copy, foreign_key: true
      t.date :due_date
      t.date :checkout_date
      t.date :checkin_date

      t.timestamps
    end
  end
end
