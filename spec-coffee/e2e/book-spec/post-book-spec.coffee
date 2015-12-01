describe 'POST /books', ->
  book = 
    author: 'Mark Twain'
    title: 'Cat in the Hat'
    keyword: 'children'
  
  it 'should successfully send post request', (done) ->
    POST '/books', book, (err, res) ->
      expect(res.statusCode).toEqual(200)
      done()

  it 'should be stored in database', (done) ->
    GET '/books?author=Mark%20Twain&title=Cat%20in%20the%20Hat', (err, res) ->
      body = res.body
      book = if body then body[0] else {}

      expect(book.author).toEqual('Mark Twain')
      expect(book.title).toEqual('Cat in the Hat')
      expect(book.keyword).toEqual('children')
      done()
