

module.exports = function (app, sql, Request) {
    
    userGet = function (req, res) {
        // Query  
        new sql.Request().query('select * from usuario').then(function (recordset) {
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
            var insertion_query = 'INSERT INTO Usuario VALUES (' + '\'' + req.body.id_User + '\',\'' + req.body.tel_User + '\',\'' + 
                          req.body.mail_User + '\',\'' + req.body.name_User + '\',\'' + req.body.type_User + '\',\'' + 
                          req.body.career_User + '\',\'' + req.body.diploma_User + '\',\'' + req.body.titles_User + 
                          '\',\'' + req.body.record_User + '\',\'' + req.body.information_User + '\')';
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

    app.get('/users', userGet);
    app.delete('/users/:id', userDelete);

    app.post('/sign_up', userAdd);
}