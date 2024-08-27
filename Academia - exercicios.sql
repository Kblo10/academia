USE academia ;

-- 1. Listar todas as categorias cadastradas.
-- Selecione todos os atributos da tabela `categorias`.
SELECT * FROM categorias ;

-- 2. Listar todos os produtos e seus respectivos preços de venda.
-- Selecione a descrição e o preço de venda da tabela `produtos`.
SELECT descricao, preco_venda FROM tabela_produtos ;

-- 3. Exibir a média dos preços de venda de todos os produtos.
-- Calcule a média dos valores da coluna `preco_venda` na tabela `produtos`.
SELECT id_categorias, AVG(preco_venda) AS 'media' 
	FROM tabela_produtos 
    GROUP BY id_categorias ;
    
-- 4. Contar quantos produtos estão cadastrados na categoria "nome".
-- Conte a quantidade de registros na tabela `produtos` onde `id_categoria` é 1.
SELECT COUNT(nome) FROM categorias ;

-- 5. Listar os produtos que possuem preço de venda superior a 10 reais.
-- Selecione os produtos da tabela `produtos` onde o preço de venda é maior que 10.
SELECT * FROM tabela_produtos
	 WHERE preco_venda > 100 ;
     
-- 6. Exibir o preço mínimo e máximo dos produtos.
-- Selecione o menor e o maior valor da coluna `preco_venda` na tabela `produtos`.
SELECT MIN(preco_venda) FROM tabela_produtos ; 
SELECT MAX(preco_venda) FROM tabela_produtos ; 


-- 7. Arredondar a média dos preços de venda dos produtos para duas casas decimais.
-- Calcule a média dos valores da coluna `preco_venda` na tabela `produtos` e arredonde para duas casas decimais.
SELECT ROUND(AVG(preco_venda),2) AS media_venda FROM tabela_produtos  ;

-- 8. Agrupar os produtos por categoria e exibir o maior preço de venda em cada grupo.
-- Selecione o maior valor da coluna `preco_venda` na tabela `produtos`, agrupando os resultados por `id_categoria`.
SELECT categorias.nome, MAX(tabela_produtos.preco_venda) 
	FROM tabela_produtos
    INNER JOIN categorias ON tabela_produtos.id_categorias = categorias.id
    GROUP BY categorias.nome ;

-- 9. Exibir as categorias onde o maior preço de venda dos produtos seja maior que 10 reais.
-- Selecione os `id_categoria` onde o maior valor da coluna `preco_venda` seja maior que 10, agrupando os resultados.
SELECT id_categorias FROM tabela_produtos
	WHERE preco_venda > 10
    GROUP BY id_categorias ;

-- 10. Exibir a descrição dos produtos e o nome das suas categorias correspondentes (INNER JOIN).
-- Selecione os produtos da tabela `produtos` junto com suas categorias, onde haja relação entre as tabelas.
SELECT tabela_produtos.descricao FROM tabela_produtos
	INNER JOIN categorias ON tabela_produtos.id_categorias = categorias.id ;

-- 11. Exibir todos os produtos, incluindo aqueles que não possuem uma categoria associada (LEFT JOIN).

SELECT * FROM tabela_produtos
LEFT JOIN categorias ON tabela_produtos.id_categorias = categorias.id ;

-- 12. Exibir todas as categorias, incluindo aquelas que não possuem produtos associados (RIGHT JOIN).
-- Selecione todas as categorias da tabela `categorias`, juntando-as com os produtos, mesmo que não haja uma correspondência.

SELECT * FROM categorias
RIGHT JOIN tabela_produtos ON tabela_produtos.id_categorias = categorias.id ;

-- 13. Exibir todos os produtos e suas categorias, incluindo aqueles que não possuem relação entre si (FULL OUTER JOIN).
-- Selecione todos os produtos e categorias, incluindo os que não possuem correspondência.
SELECT * FROM tabela_produtos
LEFT JOIN categorias ON tabela_produtos.id_categorias = categorias.id 
UNION
SELECT * FROM categorias
RIGHT JOIN tabela_produtos ON tabela_produtos.id_categorias = categorias.id ;

-- 14. Exibir o total de produtos em cada categoria e o nome da categoria.
-- Selecione o total de produtos em cada categoria, agrupando pelos nomes das categorias.
SELECT COUNT(tabela_produtos.id), categorias.nome FROM tabela_produtos, categorias
	WHERE tabela_produtos.id_categorias = categorias.id
	GROUP BY categorias.nome ;

-- 15. Exibir a soma total do preço de venda dos produtos em cada categoria.
-- Selecione a soma dos valores da coluna `preco_venda` agrupados por categoria.

SELECT categorias.nome, SUM(preco_venda) AS total_venda FROM tabela_produtos, categorias
WHERE tabela_produtos.id_categorias = categorias.id
GROUP BY categorias.nome ;

-- 16 EXIBIR O PRECO MEDIO DE VENDA DOS PRODUTOS EM CADA CATEGORIA 

SELECT categorias.nome, ROUND(AVG(preco_venda),2) AS Media_venda FROM categorias
	 JOIN tabela_produtos ON tabela_produtos.id_categorias = categorias.id
     GROUP BY categorias.id;

-- 17. Listar as categorias que possuem produtos com preço de custo superior a 20 reais
-- Selecione as categorias cujos produtos têm o valor da coluna `preco_custo` superior a 20 reais.
    
SELECT categorias.nome FROM categorias 
INNER JOIN tabela_produtos ON categorias.id = tabela_produtos.id_categorias
GROUP BY categorias.id
HAVING MIN(tabela_produtos.preco_custo) > 20;

    
-- 18. Exibir o número total de produtos e a soma dos preços de custo para cada categoria
-- Selecione a quantidade de produtos e a soma dos valores da coluna `preco_custo`, agrupando pelos nomes das categorias.
SELECT categorias.nome, COUNT(tabela_produtos.id) AS total_produtos, SUM(tabela_produtos.preco_custo) AS total_custo 
	FROM tabela_produtos
    LEFT JOIN categorias ON tabela_produtos.id_categorias = categorias.id
    GROUP BY categorias.nome ;

-- 19. Exibir o produto mais caro de cada categoria junto com seu preço de custo
-- Selecione o produto com o maior valor de `preco_venda` em cada categoria e exiba também o valor de `preco_custo`.
SELECT categorias.nome, MAX(tabela_produtos.preco_venda) AS mais_caro,
	(SELECT MAX(tabela_produtos.preco_custo) FROM tabela_produtos
    WHERE tabela_produtos.id_categorias = categorias.id) AS maior_preco_custo
	FROM tabela_produtos
	JOIN categorias ON tabela_produtos.id_categorias = categorias.id
    GROUP BY categorias.id, categorias.nome 
     ORDER BY mais_caro DESC;


-- 20. Exibir o preço de venda dos produtos com o menor preço de custo para cada categoria
-- Selecione o menor valor da coluna `preco_custo` em cada categoria e exiba o preço de venda correspondente.
SELECT categorias.nome, MIN(tabela_produtos.preco_venda) AS mais_caro,
	(SELECT MIN(tabela_produtos.preco_custo) FROM tabela_produtos
    WHERE tabela_produtos.id_categorias = categorias.id) AS maior_preco_custo
	FROM tabela_produtos
	JOIN categorias ON tabela_produtos.id_categorias = categorias.id
    GROUP BY categorias.id, categorias.nome 
     ORDER BY mais_caro;
