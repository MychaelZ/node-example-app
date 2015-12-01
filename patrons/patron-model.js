module.exports = function (sequelize, DataTypes) {
  return sequelize.define('Patron', {
    name: {type: DataTypes.STRING}
  });
}
