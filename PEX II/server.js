// server.js

const express = require('express');
const cors = require('cors');
const { Pool } = require('pg');

const app = express();
const PORT = process.env.PORT || 3000;

// Configuração de acesso ao Banco de Dados
const pool = new Pool({
  user: 'seu_usuario', // <-- coloque seu usuário do PostgreSQL
  host: 'localhost',
  database: 'abm_portfolio',
  password: 'sua_senha', // <-- coloque sua senha do PostgreSQL
  port: 5432, // Porta padrão do PostgreSQL
});

// Middleware
app.use(cors());
app.use(express.json());

// Rota para pegar perfil pessoal
app.get('/api/perfil', async (req, res) => {
  try {
    const { rows } = await pool.query('SELECT * FROM perfil_pessoal LIMIT 1');
    res.json(rows[0]);
  } catch (err) {
    console.error(err.message);
    res.status(500).send('Erro no servidor');
  }
});

// Rota para pegar todos os projetos
app.get('/api/projetos', async (req, res) => {
  try {
    const { rows } = await pool.query('SELECT * FROM projetos ORDER BY data_publicacao DESC');
    res.json(rows);
  } catch (err) {
    console.error(err.message);
    res.status(500).send('Erro no servidor');
  }
});

// Iniciar o servidor
app.listen(PORT, () => {
  console.log(`Servidor rodando na porta ${PORT}`);
});
