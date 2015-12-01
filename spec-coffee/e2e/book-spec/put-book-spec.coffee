describe 'PUT /books', ->
  book = 
    title: 'One Fish'
    author: 'Gandhi'
    keyword: 'religion'

  patron = 
    id: 1

  beforeAll (done) -> 
    POST '/books', book, (err, res) ->
      done()

  it 'should successfully send put request', (done) ->
    PUT '/books?title=One%20Fish&author=Gandhi&keyword=religion', {author: 'King'}, (err, res) ->
      expect(res.statusCode).toEqual(200)
      done()

  it 'should edit the contents', (done) ->
    GET '/books?author=King', (err, res) ->
      book = if res.body then res.body[0] else {}

      expect(res.statusCode).toEqual(200)
      expect(book.author).toEqual('King')
      expect(book.keyword).toEqual('religion')
      expect(book.title).toEqual('One Fish')
      expect(book.checkedOutBy).toEqual(0)
      done()

  it 'should checkout item', (done) ->
    PUT '/books?author=King&title=One%20Fish&keyword=religion', patron, (err, res) ->
      expect(res.statusCode).toEqual(200)
      done()

  it 'should have new checkedOutBy id', (done) ->
    GET '/books?author=King', (err, res) ->
      book = if res.body then res.body[0] else {}
      expect(res.statusCode).toEqual(200)
      expect(book.author).toEqual('King')
      expect(book.keyword).toEqual('religion')
      expect(book.title).toEqual('One Fish')
      expect(book.checkedOutBy).toEqual(1)
      done()
