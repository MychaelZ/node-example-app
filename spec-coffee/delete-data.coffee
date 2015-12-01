db = require './../build/database'
Book = db.Book
Patron = db.Patron

module.exports = () ->
  Book.drop()
  Patron.drop()
