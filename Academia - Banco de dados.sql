CREATE DATABASE IF NOT EXISTS agregacao ;

USE agregacao ;

CREATE TABLE IF NOT EXISTS categorias (
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45) NOT NULL,
    PRIMARY KEY (id)
    ) ;
    
CREATE TABLE tabela_produtos (
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
            ('stan') ;
            
INSERT INTO tabela_produtos (descricao, preco_venda, preco_custo, id_categorias)
	 VALUES ('Ganho de massa muscular', '120.00', '50.00', 1),
			('recuperação pós-treino', '40.00', '20.00', 2),
            ('Ganhos de força', '80.00', '40.00', 3),
            ('Imunidade em alta sempre', '35.00', '17.00', 4),
            ('Articulações', '30.00', '15.00', 5),
            ('Suco', '180.00', '60.00', 6) ;
            
    SELECT * FROM categorias ;
    SELECT * FROM tabela_produtos ;