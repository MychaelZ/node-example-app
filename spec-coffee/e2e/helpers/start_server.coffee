process.env.NODE_ENV = 'test'
server = require __dirname + '/../../../build/server.js'

beforeAll ->
  server.start({quiet: true})

afterAll ->
  server.stop()
