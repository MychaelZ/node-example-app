describe 'GET /patrons', ->
  it 'should get patrons and books they checked out', (done) ->
    GET '/patrons/Douglas', (err, res) ->
      body = if res.body then res.body else {}
      books = if body.books then body.books else {}
      expect(res.statusCode).toEqual(200)
      expect(body.name).toEqual('Douglas')
      expect(books).toEqual(jasmine.any(Array))
      expect(books.length >= 1).toBeTruthy()
      done()
