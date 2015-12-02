describe 'PUT /patrons', ->
  newData =
    name: 'Leeroy'

  it 'should successfully send PUT request', (done) ->
    PUT '/patrons?name=Woodrow', newData, (err, res) ->
      expect(res.statusCode).toEqual(200)
      done()

  it 'should edit patron in database', (done) ->
    GET '/patrons/Leeroy', (err, res) ->
      body = if res.body then res.body else {}
      books = if body.books then body.books else {}
      expect(res.statusCode).toEqual(200)
      expect(body.name).toEqual('Leeroy')
      expect(books).toEqual(jasmine.any(Array))
      expect(books.length >= 1).toBeTruthy()
      done()

