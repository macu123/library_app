# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

Loan.destroy_all
Copy.destroy_all
Book.destroy_all
User.destroy_all

User.create(
    email: 'admin@gmail.com', password: '12345',
    password_confirmation: '12345', admin: true
  )

CSV.foreach(File.join(Rails.root, 'db', 'import', 'test_books.csv'), headers: true) do |row|
  book = Book.create(
      title: row['Title'], author: row['Author'], genre: row['Genre'],
      sub_genre: row['SubGenre'], num_of_pages: row['Pages'].to_i,
      publisher: row['Publisher']
    )

  row['Copies'].to_i.times { book.copies.create }
end