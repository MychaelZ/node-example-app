describe 'POST /books', ->
  book = 
    author: 'Green'
    title: 'Cat in the Hat'
    keyword: 'children'
  
  it 'should successfully send POST request', (done) ->
    POST '/books', book, (err, res) ->
      expect(res.statusCode).toEqual(200)
      done()

  it 'should store book in database', (done) ->
    GET '/books?author=Green&title=Cat%20in%20the%20Hat', (err, res) ->
      body = res.body
      book = if body then body[0] else {}

      expect(book.author).toEqual('Green')
      expect(book.title).toEqual('Cat in the Hat')
      expect(book.keyword).toEqual('children')
      done()
