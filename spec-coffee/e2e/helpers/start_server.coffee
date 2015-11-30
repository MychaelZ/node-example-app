server = require __dirname + '/../../../build/server.js'
process.env.NODE_ENV = 'test'

beforeEach ->
  server.start({quiet: true})
afterEach ->
  server.stop()
