describe 'delete book', ->

  Given (done) -> DELETE '/books?author=Mark%20Twain', done, (err, res) ->
    @deleteResponse = res

  Given (done) -> GET '/books?author=Mark%20Twain', done, (err, res) ->
    @getResponse = res

  Then -> @getResponse.body.author == undefined
  Then -> @getResponse.body.title == undefined
  Then -> @getResponse.body.keyword == undefined
  Then -> @getResponse.body.checkedOutBy == undefined
