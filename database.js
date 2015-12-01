import Sequelize from 'sequelize';

var databaseName = 'exampleDB';

if (process.env.NODE_ENV === 'test') {
  var inTestEnvironment = true;
  databaseName = 'testDB';
} 

// DB
var sequelize = new Sequelize(databaseName, 'root', '', {logging: false});

// Models
var Book = sequelize.import('./books/book-model');
var Patron = sequelize.import('./patrons/patron-model');

if (!inTestEnvironment) sequelize.sync();

module.exports = {
  sequelize,
  Book,
  Patron
};
