request = require 'bhttp'

handler = (callback, done) ->
  (err, res) ->
    callback(err, res)
    done()

global.GET = (path, done, callback) -> 
  options = {}
  request.get "http://localhost:8000#{path}", options, handler(callback, done)

global.POST = (path, data, done, callback) ->
  options = {}
  request.post "http://localhost:8000#{path}", data, options, handler(callback, done)

global.PUT = (path, data, done, callback) ->
  options = {}
  request.put "http://localhost:8000#{path}", data, options, handler(callback, done)

global.DELETE = (path, done, callback) ->
  options = {}
  data = {}

  request.delete "http://localhost:8000#{path}", data, options, handler(callback, done)