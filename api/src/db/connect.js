const mysql = require ('mysql2');//Importando o Mysql que instalou "npm i mysql2"

const pool= mysql.createPool({
    connectionLimit:10,
    host:'localhost',
    user:'alunods',
    password:'senai@604',
    database:'vio'
})
module.exports = pool 






































