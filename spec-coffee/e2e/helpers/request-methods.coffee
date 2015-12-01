request = require 'bhttp'

global.GET = (path, callback) -> 
  options = {}
  request.get "http://localhost:8000#{path}", options, callback

global.POST = (path, data, callback) ->
  options = {}
  request.post "http://localhost:8000#{path}", data, options, callback

global.PUT = (path, data, callback) ->
  options = {}
  request.put "http://localhost:8000#{path}", data, options, callback

global.DELETE = (path, callback) ->
  options = {}
  request.delete "http://localhost:8000#{path}", options, callback
