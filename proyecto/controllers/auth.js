const mysql = require('mysql');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');

const db = mysql.createConnection({
  host: 'localhost',
  database: 'farmqor',
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD,
  port: 3306
});


exports.signup =  (req, res) => {
    console.log(req.body);

    const { username, telefono, password, passwordConfirm, userType } = req.body;


    db.query('SELECT Teléfono FROM usuario WHERE Teléfono = ?', [telefono], async (error, results) => {
        if(error){
            console.log(error);
        }

        if(results.length > 0){
            return res.render('signup', {
                message: 'Ese número de teléfono ya está en uso'
            })
        } else if(password !== passwordConfirm){
            return res.render('signup', {
                message: 'Las contraseñas no coinciden'
            }); 
         }

         let hashedPassword = await bcrypt.hash(password, 8);
            console.log(hashedPassword);

    
    db.query('INSERT INTO usuario SET ?', {Nombre: username, Teléfono: telefono, Contraseña: hashedPassword, Tipo_Usuario: userType}, (error, results) => {
        if(error){
            console.log(error);
        } else {
            console.log(results);
            return res.render('signup', {
                message: 'Usuario registrado'
            });
        }
    });

});

}
