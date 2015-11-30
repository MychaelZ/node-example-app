describe 'check out book', ->
  Given -> @patron = 
    id: 1

  When (done) -> GET '/books?author=Mark%20Twain', done, (err, res) ->
    @getResponse = res

  Then -> @getResponse.body.checkedOutBy == null

  When (done) -> PUT '/books?author=Mark%20Twain', @patron, done, (err, res) ->
    @putResponse = res
  When (done) -> GET '/books?author=Mark%20Twain', done, (err, res) ->
    @getResponse = res  

  Then -> @putResponse.statusCode == 200
  Then -> @getResponse.body.checkedOutBy == 1

  When (done) -> PUT '/books?author=Mark%20Twain', @patron, done, (err, res) ->
    @putResponse = res
  When (done) -> GET '/books?author=Mark%20Twain', done, (err, res) ->
    @getResponse = res  

  Then -> @getResponse.body.checkedOutBy == null
