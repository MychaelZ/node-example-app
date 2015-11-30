describe 'create book', ->
  Given -> @data = 
    author: 'Dr. Suess'
    title: 'Cat in the hat'
    keyword: 'children'
  
  Given (done) -> POST '/books', @data, done, (err, res) ->
    @postResponse = res

  Given (done) -> GET '/books?author=Dr.%20Suess', done, (err, res) ->
    @getResponse = res

  Then -> @postResponse.status == 200
  Then -> @getResponse.body.author == @data.author
  Then -> @getResponse.body.title  == @data.title
  Then -> @getResponse.body.keyword == @data.keyword
  Then -> @getResponse.body.checkedOutBy == null
