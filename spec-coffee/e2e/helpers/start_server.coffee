process.env.NODE_ENV = 'test'
Promise = require 'bluebird'
server = require __dirname + '/../../../build/server.js'
database = require __dirname + '/../../../build/database.js'
Book = database.Book
Patron = database.Patron
seedFakeData = require './../../seed-data'
deleteFakeData = require './../../delete-data'

beforeAll (done) ->
  server.start({quiet: true, callback: () -> seedFakeData(done)})

afterAll ->
  server.stop({callback: deleteFakeData})
