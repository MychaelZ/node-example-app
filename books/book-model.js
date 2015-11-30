module.exports = function (sequelize, DataTypes) {
  return sequelize.define('Book', {
    author: {type: DataTypes.STRING},
    title: {type: DataTypes.STRING},
    keyword: {type: DataTypes.STRING},
    checkedOutBy: {type: DataTypes.INTEGER}
  });
}
