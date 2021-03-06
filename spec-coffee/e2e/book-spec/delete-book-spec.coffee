describe 'DELETE /books', ->
  book = 
    author: 'Meow'
    title: 'Fur ball'
    keyword: 'comedy'

  beforeAll (done) ->
    POST '/books', book, (err, res) ->
      done()

  it 'should 500 when deleting book without all parameters', (done) ->
    DELETE '/books?author=Meow', (err, res) ->
      expect(res.statusCode).toEqual(500)
      done()

  it 'should not have deleted book from database without all parameters', (done) ->
    GET '/books?author=Meow', (err, res) ->
      book = if res.body then res.body[0] else {}
      expect(res.statusCode).toEqual(200)
      expect(book.author).toEqual('Meow')
      expect(book.title).toEqual('Fur ball')
      expect(book.keyword).toEqual('comedy')
      done()

  it 'should successfully send DELETE request', (done) ->
    DELETE '/books?author=Meow&title=Fur%20ball&keyword=comedy', (err, res) ->
      expect(res.statusCode).toEqual(200)
      done()

  it 'should remove book from database', (done) ->
    GET '/books?author=Meow', (err, res) ->
      expect(res.statusCode).toEqual(200)
      expect(res.body.length).toEqual(0)
      done()
