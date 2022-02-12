module.exports = (app, name) => {
    const connection = require('./mysql');
    // route that gets test by id
    app.get('/teste/:id', (req, res) => {
        connection.query(
            `SELECT * FROM ${name} WHERE id = ?`,
            [req.params.id],
            (err, results) => {
                if (err) {
                    res.send(err)
                    return;
                }
                res.json(results[0]);
            }
        );
    });
    app.get('/teste', (req, res) => {
        //get the data from table teste
        connection.query(`SELECT * FROM ${name}`, (err, results) => {
            if (err) {
                res.send(err)
                return;
            }
            res.json(results);
        });
    });
    app.post('/teste/', (req, res) => {
        if(req.body.id == 0){
        connection.query(
            `INSERT INTO ${name} SET ?`,
            req.body,
            (err, result) => {
                if (err) {
                    res.send(err)
                    return;
                }
                res.send(result)
            }
        );
        }else{
            connection.query(
                `UPDATE ${name} SET ? WHERE id = ?`,
                [req.body, req.body.id],
                (err, result) => {
                    if (err) {
                        res.send(err)
                        return;
                    }
                    res.send(result)
                }
            );
        }
        
    });
}