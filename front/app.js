//Acessao objeto "document" que  respresenta a página html

const { json } = require("body-parser");
const { application } = require("express");

//Seleciona o elemento com o id indicado do formulário
document
.getElementById("formulário-registro")
//adiciona o ouvinte de evento(submit)para capturar o envio do formulário
.addEventListener("submit", function(event){
//previne o comportamento padrão do formulário, ou seja, impede que ele saja enviado e recarregue a página
event.preventDefault()
//Captura os valores dos compos de formulario
const name = document.getElementById("name");
const cpf = document.getElementById("cpf");
const email = document.getElementById("email");
const password = document.getElementById("password");

//Requisção HTTP para o endpoint de cadastro de usuário
fetch("http://localhost:5000/api/v1/user",{
    //Realiza uma chamada HTTP para o servidor (a rota definida)
    method:"POST",
    headers:{
        //A requisição será em formato json
        "Conten-Type":application/json
    },
    //Transforma os dados do formulário em uma string json para serem emviados no corpo da requisição
    body:JSON.stringify({name,cpf,password,email}),
})

});
