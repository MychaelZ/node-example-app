describe 'GET /books', ->
  book = 
    author: 'Mark Twain'
    title: 'Roughing It'
    keyword: 'satire'

  thenCheckIfBook = (done) ->
    (err, res) ->

      book = if res.body then res.body[0] else {}

      expect(res.statusCode).toEqual(200)
      expect(res.body).toEqual(jasmine.any(Array))
      expect(book.author).toEqual('Mark Twain')
      expect(book.title).toEqual('Roughing It')
      expect(book.keyword).toEqual('satire')
      done()
      
  beforeAll (done) ->
    POST '/books', book, (err, res) => 
      done()

  it 'should return book by author', (done) ->
    GET '/books?author=Mark%20Twain', thenCheckIfBook(done)

  it 'should return book by keyword', (done) ->
    GET '/books?keyword=satire', thenCheckIfBook(done)

  it 'should return book by title', (done) ->
    GET '/books?title=Roughing%20It', thenCheckIfBook(done)
