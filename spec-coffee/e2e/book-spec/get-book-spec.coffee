describe 'GET /books', ->
  book = 
    title: 'Star Wars'
    author: 'Musk'
    keyword: 'space'

  thenCheckIfBook = (done) ->
    (err, res) ->

      book = if res.body then res.body[0] else {}

      expect(res.statusCode).toEqual(200)
      expect(res.body).toEqual(jasmine.any(Array))
      expect(book.author).toEqual('Musk')
      expect(book.title).toEqual('Star Wars')
      expect(book.keyword).toEqual('space')
      done()
      
  beforeAll (done) ->
    POST '/books', book, (err, res) => 
      done()

  it 'should get books by author', (done) ->
    GET '/books?author=Musk', thenCheckIfBook(done)

  it 'should get books by keyword', (done) ->
    GET '/books?keyword=space', thenCheckIfBook(done)

  it 'should get books by title', (done) ->
    GET '/books?title=Star%20Wars', thenCheckIfBook(done)
