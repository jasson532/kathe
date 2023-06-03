const mysql = require('mysql');

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'sqluser',
    password: 'password',
    database: 'registro-notas'
  });

module.exports = connection;
