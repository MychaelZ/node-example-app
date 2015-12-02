describe 'GET /patrons', ->
  it 'should get patron and checked out books', (done) ->
    GET '/patrons/Douglas', (err, res) ->
      body = if res.body then res.body else {}
      books = if body.books then body.books else {}
      expect(res.statusCode).toEqual(200)
      expect(body.name).toEqual('Douglas')
      expect(books).toEqual(jasmine.any(Array))
      expect(books.length >= 1).toBeTruthy()
      done()

  it 'should 404 when getting patron that does not exist', (done) ->
    GET '/patrons/notExist', (err, res) ->
      expect(res.statusCode).toEqual(404)
      done()
