import { Book } from './../database';
import { filterObject, sendData, sendError } from './../utils';
import _ from 'underscore';

module.exports = {

  retrieveBook: function (req, res, next) {
    var query = filterObject(req.query, ['author', 'title', 'keyword']);

    Book
      .findAll({
        where: query
      })
      .then(sendData(res))
      .catch(sendError(res, 'Could not find book with that query'));
  },

  createBook: function (req, res, next) {
    var newBook = _.extend(filterObject(req.body, ['author', 'title', 'keyword'], true), {checkedOutBy: 0});

    Book
      .create(newBook)
      .then(sendData(res))
      .catch(sendError(res, 'Could not save book to database'));
  },

  checkOutBook: function (req, res, next) {
    var query = filterObject(req.query, ['author', 'title', 'keyword'], true);

    Book
      .update({checkedOutBy: req.body.id}, {
        where: query
      })
      .then(sendData(res))
      .catch(sendError(res, 'Could not find or update book'));
  },

  deleteBook: function (req, res, next) {
    var query = filterObject(req.query, ['author', 'title', 'keyword'], true);

    Book
      .findOne({
        where: query
      })
      .then((foundBook) => {
        return foundBook.destroy();
      })
      .then(sendData(res))
      .catch(sendError(res, 'Could not find the book'));
  }
};
