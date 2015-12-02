describe 'PUT /books', ->
  book = 
    title: 'Sky Castle'
    author: 'Miner'
    keyword: 'Fantasy'

  patron = 
    id: 100

  beforeAll (done) -> 
    POST '/books', book, (err, res) ->
      done()

  it 'should successfully send PUT request', (done) ->
    PUT '/books?title=Sky%20Castle&author=Miner&keyword=Fantasy', {author: 'King'}, (err, res) ->
      expect(res.statusCode).toEqual(200)
      done()

  it 'should edit book in database', (done) ->
    GET '/books?author=King', (err, res) ->
      book = if res.body then res.body[0] else {}
      expect(res.statusCode).toEqual(200)
      expect(book.author).toEqual('King')
      expect(book.keyword).toEqual('Fantasy')
      expect(book.title).toEqual('Sky Castle')
      expect(book.checkedOutBy).toEqual(0)
      done()

  it 'should checkout item', (done) ->
    PUT '/books?author=Mao&title=1984&keyword=London', patron, (err, res) ->
      expect(res.statusCode).toEqual(200)
      done()

  it 'should have new checkedOutBy id', (done) ->
    GET '/books?author=Mao', (err, res) ->
      book = if res.body then res.body[0] else {}
      expect(res.statusCode).toEqual(200)
      expect(book.author).toEqual('Mao')
      expect(book.keyword).toEqual('London')
      expect(book.title).toEqual('1984')
      expect(book.checkedOutBy).toEqual(100)
      done()
