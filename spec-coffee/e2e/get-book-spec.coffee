describe 'retrieve book', ->
  Given (done) -> GET '/books?author=Mark%20Twain', done, (err, res) ->
    @response = res

  Then -> @response.status == 200
  Then -> @response.body.author == 'Mark Twain'
  Then -> @response.body.title == 'Roughing It'
  Then -> @response.body.keyword == 'satire'
  Then -> @response.body.checkedOutBy == null
