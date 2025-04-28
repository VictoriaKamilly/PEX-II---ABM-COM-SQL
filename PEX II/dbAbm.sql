-- Arquivo: abm_portfolio.sql

-- Cria o banco de dados (opcional)
CREATE DATABASE abm_portfolio;

-- Conecta ao banco criado
\c abm_portfolio;

-- Tabela: Perfil Pessoal
CREATE TABLE perfil_pessoal (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    cargo VARCHAR(255),
    bio TEXT,
    email VARCHAR(255),
    telefone VARCHAR(20),
    linkedin_url VARCHAR(255),
    github_url VARCHAR(255),
    imagem_perfil_url VARCHAR(255),
    data_atualizacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela: Projetos
CREATE TABLE projetos (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL,
    imagem_capa_url VARCHAR(255),
    link_projeto VARCHAR(255),
    tecnologias_utilizadas TEXT,
    data_publicacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela: Habilidades
CREATE TABLE habilidades (
    id SERIAL PRIMARY KEY,
    habilidade_nome VARCHAR(255) NOT NULL,
    nivel VARCHAR(50), -- Exemplo: Básico, Intermediário, Avançado
    categoria VARCHAR(100)
);

-- Tabela: Posts de Blog (opcional)
CREATE TABLE posts_blog (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    conteudo TEXT NOT NULL,
    imagem_capa_url VARCHAR(255),
    data_publicacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);