CREATE DATABASE IF NOT EXISTS academia ;

USE academia ;

CREATE TABLE IF NOT EXISTS categorias (
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    PRIMARY KEY (id)
    ) ;
    
CREATE TABLE IF NOT EXISTS tabela_produtos (
	id INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(45) NOT NULL,
    preco_venda DECIMAL(10,2) NOT NULL,
    preco_custo DECIMAL(10,2) NOT NULL,
    id_categorias INT, 
    PRIMARY KEY(id),
    FOREIGN KEY(id_categorias) REFERENCES categorias(id) 
    );
    
INSERT INTO categorias (nome)
     VALUES ('whey'),
	    ('bcaa'),
            ('creatina'),
            ('multivitaminico'),
            ('colageno'),
            ('stan'),
            ('emagrecedor');
            
INSERT INTO tabela_produtos (descricao, preco_venda, preco_custo, id_categorias)
	 VALUES ('Ganho de massa muscular', '120.00', '50.00', 1),
		('recuperação pós-treino', '40.00', '20.00', 2),
                ('Ganhos de força', '80.00', '40.00', 3),
                ('Imunidade em alta sempre', '35.00', '17.00', 4),
                ('Articulações', '30.00', '15.00', 5),
                ('Suco', '180.00', '60.00', 6) ;
            
    SELECT * FROM categorias ;
    SELECT * FROM tabela_produtos ;
    
INSERT INTO tabela_produtos (descricao, preco_venda, preco_custo,id_categorias)
	VALUES ('emagrecedor', '5.00', '2.00', 7);
    
CREATE TABLE IF NOT EXISTS cliente (
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(45),
cpf VARCHAR(14),
tel VARCHAR(16),
PRIMARY KEY(id)
);   

CREATE TABLE IF NOT EXISTS vendas (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
data_venda DATETIME NOT NULL,
id_cliente INT,
FOREIGN KEY (id_cliente) REFERENCES cliente(id)) ;

-- -------------------------------------------------------------------
                   -- INSERINDO CLIENTES --
-- ------------------------------------------------------------------
INSERT INTO cliente(nome, cpf, tel)
     VALUES ('Jeferson','043.383.601-60','61-9-9853-6947'),
	    ('Alan','041.727.601-60','61-9-9283-6947'),
            ('Vini Jr','253.383.901-60','61-9-9684-6947'),
            ('Rebeca','043.343.647-60','61-9-9963-6947'),
            ('Gabigol','143.853.601-60','61-9-9273-1897'),
            ('Arrascaeta','333.383.601-60','61-9-6543-6947'),
            ('Tite','073.683.981-60','61-9-9283-7417'),
            ('Mbappe','054.355.601-60','61-9-2583-6947'),
            ('Cristiano Ronaldo','874.383.601-60','61-9-9447-6947'),
            ('David Beckham','043.382.191-60','61-9-9113-3487');

-- ----------------------------------------------------------------------
                  -- INSERINDO AS VENDAS DOS CLIENTES --
-- ----------------------------------------------------------------------
INSERT INTO vendas(data_venda, id_cliente)
     VALUES ('2024-08-23 14:10:00','1'),
	    ('2024-08-23 15:20:00','2'),
            ('2024-08-23 16:30:00','3'),
            ('2024-08-23 17:40:00','4'),
            ('2024-08-23 14:25:00','5'),
            ('2024-08-23 15:15:00','6'),
            ('2024-08-23 16:05:00','7'),
            ('2024-08-23 17:14:00','8'),
            ('2024-08-23 13:58:00','9'),
            ('2024-08-23 17:29:00','10');
            
-- ----------------------------------------------------------------------
		-- CRIANDO ASSOCIACAO ENTRE AS VENDAS E OS PRODUTOS --
-- -----------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS vendas_has_produtos (
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_vendas INT,
id_produtos INT,
quantidade INT,
FOREIGN KEY (id_vendas) REFERENCES vendas(id),
FOREIGN KEY (id_produtos) REFERENCES tabela_produtos(id));

-- ------------------------------------------------------------------------------
       -- INSERINDO OS IDS DAS VENDAS E PRODUTOS, E A QUANTIDADE --    
-- ------------------------------------------------------------------------------
INSERT INTO vendas_has_produtos (id_vendas, id_produtos, quantidade)
	VALUES  (1, 1, 1),
		(2, 2, 2),
		(3, 3, 3),
		(4, 4, 4),
		(5, 5, 5),
		(6, 6, 6),
		(7, 5, 7),
		(8, 1, 1),
		(9, 2, 2),
		(10, 2, 2);

SELECT * FROM tabela_produtos ;
