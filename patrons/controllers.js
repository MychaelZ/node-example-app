import { Patron, Book } from './../database';
import Promise from 'bluebird';
import { filterObject, sendData, sendError } from './../utils';

module.exports = {

  findPatron: function (req, res, next) {
    var { name } = req.params;

    Patron
      .findOne({
        where: {name}
      })
      // append books to patron object
      .then((patron) => {
        return Book
          .findAll({
            where: {
              checkedOutBy: patron.id
            }
          })
          .then((books) => {
            var { name } = patron;
            return {
              name,
              books
            };
          })
          // if patron has no books
          .catch(() => {
            return {
              patron,
              books: []
            };
          });
      })
      .then(sendData(res))
      .catch(sendError(res, 'Could not find patron with that name'), 404);
  },

  createPatron: function (req, res, next) {
    var { name } = req.body;

    Patron
      .create({name})
      .then(sendData(res))
      .catch(sendError(res, 'Could not save patron to database'));
  },

  editPatron: function (req, res, next) {
    var query = filterObject(req.query, ['name']);
    var { name } = req.body;

    Patron
      .update({name}, {
        where: query
      })
      .then(sendData(res))
      .catch(sendError(res, 'Could not find or edit patron'));
  },

  deletePatron: function (req, res, next) {
    var query = filterObject(req.query, ['name']);

    Patron
      .findOne({
        where: query
      })
      .then((foundPatron) => {
        return foundPatron.destroy();
      })
      .then(sendData(res))
      .catch(sendError(res, 'Could not find the patron'));
  }
};
