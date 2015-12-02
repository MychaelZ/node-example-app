import _ from 'underscore';

module.exports = {
  filterObject: function (query, properties, requireProps) {
    var filteredObject = {};

    properties.forEach((property) => {
      if (query[property] !== undefined || requireProps) filteredObject[property] = query[property];
    });

    return filteredObject;
  },

  sendData: function (response) {
    return function (data) {
      return response.status(200).json(data);
    };
  },

  spy: function (req, response) {
    return function (data) {
      console.log(data);
      return response.status(200).json(data);
    };
  },

  sendError: function (response, message, statusCode) {
    statusCode = statusCode || 500;
    return function (err) {
      return response.status(statusCode).json(message);
    };
  }
}
