process.env.NODE_ENV = 'test'
server = require __dirname + '/../../../build/server.js'
seedFakeData = require './../../seed-data'
deleteFakeData = require './../../delete-data'

beforeAll (done) ->
  server.start({quiet: true, callback: () -> seedFakeData(done)})

afterAll ->
  server.stop({callback: deleteFakeData})
