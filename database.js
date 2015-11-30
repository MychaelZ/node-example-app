import Sequelize from 'sequelize';

var databaseName = (process.env.NODE_ENV !== 'test') ? 'exampleDB' : 'testDB';

var sequelize = new Sequelize(databaseName, 'root', '', {logging: false});
var Books = sequelize.import('./books/book-model');
// var Patrons = sequelize.import('./patrons/patron-model');

sequelize.sync();

module.exports = {
  sequelize,
  Books,
  //Patrons
}
