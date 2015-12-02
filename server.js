import express from 'express';
import bodyParser from 'body-parser';
import bookRoutes from './books/routes';
import patronRoutes from './patrons/routes';

var app = express();

app.use(bodyParser.urlencoded({extended: true}));

app.use('/books', bookRoutes);
app.use('/patrons', patronRoutes);

module.exports = {
  start: function (options = {}) {
    this.server = app.listen(8000, () => {
      if (!options.quiet) console.log('server on port 8000');
      if (options.callback) options.callback();
    });
  },

  stop: function (options = {}) {
    if (options.callback) options.callback();
    this.server.close();
  }
};
