const mysql = require ('mysql2');//Importando o Mysql que instalou "npm i mysql2"

const pool= mysql.createPool({
    connectionLimit:10,
    host:'10.89.240.80',
    user:'alunods',
    password:'senai@604',
    database:'vio_livia'
})
module.exports = pool 






































