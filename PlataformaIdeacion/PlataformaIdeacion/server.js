var express = require('express');
var bodyParser = require('body-parser');
var sql = require('mssql');
var Request = require('tedious').Request;
var users = require('./controllers/users');
var app = express();
var port = process.env.port || 3000;

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

app.listen(port, function () {
    console.log('Plataforma de Ideacion escuchando por el puerto',port);
});

sql.connect("mssql://sa:sql.2016@localhost/PlataformaIdeacion").then(function () {
    console.log('Succesfully connected to SQL server!');
});

app.get('/', function (req, res) { 
    res.send('Bienvenido a la plataforma de ideación');
});

module.exports = app;
module.exports = sql;
module.export = Request;
users(app,sql,Request);