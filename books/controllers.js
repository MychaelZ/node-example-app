import { Book } from './../database';
import { filterObject, sendData, sendError, spy } from './../utils';
import _ from 'underscore';

module.exports = {

  retrieveBook: function (req, res, next) {
    var query = filterObject(req.query, ['author', 'title', 'keyword']);

    Book
      .findAll({
        where: query
      })
      .then(sendData(res))
      .catch(sendError(res, 'Could not find any book with that query'));
  },

  createBook: function (req, res, next) {
    var newBook = _.extend(filterObject(req.body, ['author', 'title', 'keyword'], true), {checkedOutBy: 0});

    Book
      .create(newBook)
      .then(sendData(res))
      .catch(sendError(res, 'Could not save book to database'));
  },

  editBook: function (req, res, next) {
    var query = filterObject(req.query, ['author', 'title', 'keyword'], true);
    var checkedOutBy = req.body.id ? {checkedOutBy: req.body.id} : {};
    var newValues = _.extend(filterObject(req.body, ['author', 'title', 'keyword']), checkedOutBy);

    Book
      .update(newValues, {
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
      .catch(sendError(res, 'Could not find or delete the book'));
  }
};
