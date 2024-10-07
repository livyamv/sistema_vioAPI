//Acessao objeto "document" que  respresenta a página html
//Seleciona o elemento com o id indicado do formulário
document
.getElementById("formulário-registro")
//adiciona o ouvinte de evento(submit)para capturar o envio do formulário
.addEventListener("submit", function(event){
//previne o comportamento padrão do formulário, ou seja, impede que ele saja enviado e recarregue a página
event.preventDefault()
//Captura os valores dos compos de formulario
const nome = document.getElementById("nome");
const cpf = document.getElementById("cpf");
const email = document.getElementById("email");
const senha = document.getElementById("senha");
});
