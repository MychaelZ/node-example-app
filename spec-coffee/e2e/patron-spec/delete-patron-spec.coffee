describe 'DELETE /patrons', ->

  it 'should successfully send DELETE request', (done) ->
    DELETE '/patrons?name=Theodore', (err, res) ->
      expect(res.statusCode).toEqual(200)
      done()

  it 'should remove patron from database', (done) ->
    GET '/patrons/Theodore', (err, res) ->
      expect(res.statusCode).toEqual(500)
      done()
  
