const jwt = require("jsonwebtoken");

function verifyJWT(req, res, next) {
  const token = req.headers["authorization"]; // Pega o token do cabeçalho

  if (!token) {
    return res.status(401).json({ auth: false, message: "Token não foi fornecido" });
  }

  // Verifica o token
  jwt.verify(token, process.env.SECRET, (err, decoded) => {
    if (err) {
      return res.status(403).json({
        auth: false,
        message: "Falha na autenticação do token",
      });
    }

    req.userId = decoded.id; // Salva o id do usuário na requisição
    next(); // Passa para o próximo middleware ou controller
  });
}

module.exports = verifyJWT;
