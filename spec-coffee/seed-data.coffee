Promise = require 'bluebird'
db = require './../build/database'
Book = db.Book
Patron = db.Patron

Patrons = [
  {name: 'Douglas'}
  {name: 'Dee'}
  {name: 'Theodore'}
  {name: 'Woodrow'}
]

Books = [
  title: 'The Prince'
  author: 'Gandhi'
  keyword: 'Parenting'
  checkedOutBy: 1
,
  title: '1984'
  author: 'Mao'
  keyword: 'London'
  checkedOutBy: 2
,
  title: 'Harry Potter'
  author: 'Sammy'
  keyword: 'British'
  checkedOutBy: 3
,
  title: 'Cool Book'
  author: 'Cool Guy'
  keyword: 'US'
  checkedOutBy: 4
]

module.exports = (done) ->
  join = Promise.join

  addPatrons = -> 
    Promise.map Patrons, (patron) -> 
      Patron
        .create(patron)

  addBooks = ->
    Promise.map Books, (book) -> 
      Book
        .create(book)

  join Book.sync().then(addBooks)
  ,
    Patron.sync().then(addPatrons)
  , () ->
    done()
