import express from 'express';
import bodyParser from 'body-parser';

var app = express();

app.use(bodyParser.urlencoded({extended: true}));

app.get('/', (req, res, next) => {
  return res.status(200).send();
});

app.post('/', (req, res, next) => {
  return res.status(200).send();
});

app.put('/', (req, res, next) => {
  return res.status(200).send();
});

app.delete('/', (req, res, next) => {
  return res.status(200).send();
});

module.exports = {
  start: function (options = {}) {
    this.server = app.listen(8000, () => {
      if (!options.quiet) console.log('server on port 8000');
    });
  },

  stop: function () {
    this.server.close();
  }
};
