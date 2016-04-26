

module.exports = function (app, sql, Request) {
    
    usersGet = function (req, res) {
        // Query  
        new sql.Request().query('select * from usuario').then(function (recordset) {
            res.send(recordset);
        }).catch(function (err) {
		// ... query error checks 
        });
    }
    
    userGet = function (req, res) {
        // Query  
        var insertion_query = 'SELECT * FROM usuario WHERE id_Usuario = \'' + req.params.id + '\';';
        new sql.Request().query(insertion_query).then(function (recordset) {
            res.send(recordset);
        }).catch(function (err) {
		// ... query error checks 
        });
    }
    
    userAdd = function (req, res) {
        console.log('POST');
        var transaction = new sql.Transaction();
        transaction.begin(function (err) {
            
            var request = new sql.Request(transaction);
            var insertion_query = 'INSERT INTO Usuario VALUES (' + '\'' + req.body.id_User + '\',\'' + req.body.telefono + '\',\'' + 
                          req.body.correo + '\',\'' + req.body.nombre_Usuario + '\',\'' + req.body.tipo_De_Usuario + '\',\'' + 
                          req.body.carrera + '\',\'' + req.body.diploma + '\',\'' + req.body.titulos + 
                          '\',\'' + req.body.expediente_Laboral + '\',\'' + req.body.informacion_Personal + '\')';
            console.log(insertion_query);
            request.query(insertion_query, function (err, recordset) {
                if (!err) {
                    transaction.commit(function (err, recordset) {
                        if (!err) {
                            console.log('Transaction committed.');
                        } else {
                            console.log(err);
                        }
                    });
                } else {
                    console.log('Error!', err);
                } 
            });
        });
    }
    
    userDelete = function (req, res) {
        console.log('DELETE');
        var transaction = new sql.Transaction();
        transaction.begin(function (err) {
            
            var request = new sql.Request(transaction);
            var insertion_query = 'DELETE FROM Usuario WHERE id_Usuario = \''+req.params.id+'\';';
            request.query(insertion_query, function (err, recordset) {
                if (!err) {
                    transaction.commit(function (err, recordset) {
                        if (!err) {
                            console.log('Transaction committed.');
                        } else {
                            console.log(err);
                        }
                    });
                } else {
                    console.log('Error!', err);
                }
            });
        });
    }
    
    userUpdate = function (req, res){
        console.log('UPDATE');
        var transaction = new sql.Transaction();
        transaction.begin(function (err) {
            var array = Object.keys(req.body);
            var request = new sql.Request(transaction);
            var insertion_query = 'UPDATE Usuario SET ' 
                + array[0] + ' = \'' + req.body.telefono + '\', ' 
                + array[1] + ' = \'' + req.body.correo + '\', ' 
                + array[2] + ' = \'' + req.body.nombre_Usuario + '\', ' 
                + array[3] + ' = \'' + req.body.tipo_De_Usuario + '\', ' 
                + array[4] + ' = \'' + req.body.carrera + '\', ' 
                + array[5] + ' = \'' + req.body.diploma + '\', ' 
                + array[6] + ' = \'' + req.body.titulos + '\', ' 
                + array[7] + ' = \'' + req.body.expediente_Laboral + '\', ' 
                + array[8] + ' = \'' + req.body.informacion_Personal + '\' ' +
                'WHERE id_Usuario = \''  + req.params.id + '\';';

            request.query(insertion_query, function (err, recordset) {
                if (!err) {
                    transaction.commit(function (err, recordset) {
                        if (!err) {
                            console.log('Transaction committed.');
                        } else {
                            console.log(err);
                        }
                    });
                } else {
                    console.log('Error!', err);
                }
            });
            console.log(insertion_query);
        });
    }

    app.get('/users', usersGet);
    app.get('/users/:id', userGet);
    app.delete('/users/:id', userDelete);
    app.put('/users/update/:id', userUpdate);
    app.post('/sign_up', userAdd);
}