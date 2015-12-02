describe 'POST /patrons', ->
  patron = 
    name: 'Joe'

  it 'should successfully send a POST request', (done) ->
    POST '/patrons', patron, (err, res) ->
      expect(res.statusCode).toEqual(200)
      done()

  it 'should save patron to database', (done) ->
    GET '/patrons/Joe', (err, res) ->
      body = if res.body then res.body else {}
      books = if body.books then body.books else {}
      expect(res.statusCode).toEqual(200)
      expect(body.name).toEqual('Joe')
      expect(books.length).toEqual(0)
      done()
