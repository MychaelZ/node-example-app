# Library API

A small API for a library.

## Usage

Build tool of choice is gulp; simply run gulp while developing, and it will watch for changes.

### Installing Dependencies

Initialize MySQL database:

```sh
mysql.server start
mysql -u root
CREATE DATABASE exampleDB;
CREATE DATABASE testDB;
```

From within the root directory:

```sh
npm install
gulp
```

### Running the app

The server uses port 8000 or the PORT environment variable.

From within the root directory:

```sh
npm start
```