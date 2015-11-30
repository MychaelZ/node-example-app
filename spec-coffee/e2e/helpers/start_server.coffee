server = require __dirname + '/../../../build/server.js'

beforeEach ->
  server.start({quiet: true})
afterEach ->
  server.stop()
