CREATE DATABASE livraria;
USE livraria;

-- Criação da tabela cliente
CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
	data_cadastro DATE,
    nome VARCHAR(50) NOT NULL,
    endereco VARCHAR(100),
    email VARCHAR(50),
    sexo VARCHAR(10),
    idade INT
);

ALTER TABLE cliente ADD COLUMN data_cadastro DATE;

INSERT INTO cliente (data_cadastro, nome, endereco, email, sexo, idade)
VALUES 
("10/08/24","Márcio", "Av João dias 2400", "mcdias@gmail.com","M", "38"),
("11/07/24","Rafaela", "Rua Félix Andrades 290", "rfandrades@gmail.com","F", "25"),
("12/06/24","Gustavo", "Av Ibirapuera 438", "gvibirapuera@gmail.com","M","52"),
("13/05/24","Antônia", "Rua Geraldo Henrique 65", "athenrique@gmail.com","F", "35"),
("12/04/24","Carlos", "Rua Bartolomeu Ferrari 758", "csferrari@gmail.com","M", "36"),
("15/09/24", "Mariana", "Avenida das Palmeiras 123", "mariana.souza@gmail.com", "F", "29"),
("22/07/24", "João Pereira", "Rua dos Pássaros 45", "joao.pereira@hotmail.com", "M", "42"),
("30/08/24", "Ana Clara Martins", "Rua do Sol 890", "ana.martins@yahoo.com", "F", "31"),
("05/09/24", "Luís Fernando Silva", "Travessa das Oliveiras 67", "luis.silva@outlook.com", "M", "28"),
("10/10/24", "Beatriz Lima", "Rua das Acácias 310", "bia.lima@gmail.com", "F", "35");

-- Criação da tabela pedido
CREATE TABLE pedido (
    id_pedidos INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    descricao VARCHAR(100) NOT NULL,
    datapedido DATE NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

INSERT INTO pedido (descricao, datapedido)
VALUES
("Status do envio", "23/08/24"),
("Forma de pagamento escolhida", "22/07/24"),
("Forma de envio escolhida", "20/05/24"),
("Status do envio", "31/06/24"), 
("Forma de pagamento escolhida", "15/04/24"),
("Status do envio", "30/08/24"),
("Forma de pagamento escolhida", "17/07/24"),
("Forma de envio escolhida", "10/05/24"),
("Status do envio", "31/08/24"), 
("Forma de pagamento escolhida", "15/07/24");

-- Criação da tabela livros
CREATE TABLE livros (
    id_livros INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    tipo_livro VARCHAR(100) NOT NULL,
    nome_livro VARCHAR(100) NOT NULL,
    editora VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

INSERT INTO livros (tipo_livro, nome_livro, editora)
VALUES
("Romance", "Um verão na Ítalia", "Verus"),
("Poesia", "O meu quintal é maior que o mundo", "Saraiva"),
("Infantis", "O menino maluquinho", "Melhoramentos"),
("Didáticos", "Matemática", "Moderna"),
("Contos", "Um amigo para sempre", "FTD"),
("Ficção Científica", "Duna", "Aleph"),
("Biografia", "Steve Jobs", "Companhia das Letras"),
("Suspense", "O Código Da Vinci", "Arqueiro"),
("História", "Sapiens: Uma Breve História da Humanidade", "L&PM"),
("Autoajuda", "Os 7 Hábitos das Pessoas Altamente Eficazes", "BestSeller");

-- Criação da tabela vendedor
CREATE TABLE vendedor (
    id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    nome_vendedor VARCHAR(255),
    email_vendedor VARCHAR(255),
    telefone_vendedor VARCHAR(20),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

INSERT INTO vendedor (nome_vendedor, email_vendedor, telefone_vendedor)
VALUES
("Carlos Silva", "carlos.silva@example.com", "(11) 99999-9999"),
("Maria Oliveira", "maria.oliveira@example.com", "(21) 98888-8888"),
("João Pereira", "joao.pereira@example.com", "(31) 97777-7777");


-- EXERCICIOS ABAIXO REFERENTE AO BANCO

-- Listar os Usuários cadastrados no Banco
SELECT * FROM cliente;

-- Quantos Usuários foram cadastrados no último mês?
SELECT COUNT(*) AS total_usuarios_ultimo_mes
FROM cliente
WHERE data_cadastro >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

-- Criar script para restaurar informações de login de 1 usuário
SELECT * FROM cliente
WHERE id_cliente = 4;

-- Criar script de seleção de Livros cadastrados
SELECT * FROM livros;

-- Criar script de livros emprestados por cliente
SELECT c.nome, l.nome_livro, l.tipo_livro
FROM livros l
JOIN cliente c ON l.id_cliente = c.id_cliente;

-- Elaborar 3 perguntas utilizando as cláusulas: DISTINCT, NOT, TOP:

-- Quais são os diferentes tipos de livros cadastrados na tabela?
SELECT DISTINCT tipo_livro FROM livros;

-- Quais clientes não têm livros cadastrados?
SELECT * FROM cliente
WHERE id_cliente NOT IN (SELECT id_cliente FROM livros);

-- Quais são os 5 primeiros livros mais recentes cadastrados?
SELECT * FROM livros
ORDER BY id_livros DESC
LIMIT 5;