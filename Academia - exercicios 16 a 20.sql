USE agregacao ;
-- 16. Exibir o preço médio de venda dos produtos em cada categoria
-- Selecione a média dos valores da coluna `preco_venda`, agrupando pelos nomes das categorias.
SELECT categorias.nome, ROUND(AVG(tabela_produtos.preco_venda),2) AS media_venda FROM tabela_produtos
	JOIN categorIas ON tabela_produtos.id_categorias = categorias.id 
    GROUP BY categorias.nome ;

-- 17. Listar as categorias que possuem produtos com preço de custo superior a 20 reais
-- Selecione as categorias cujos produtos têm o valor da coluna `preco_custo` superior a 20 reais.
SELECT categorias.nome, preco_custo FROM tabela_produtos
	JOIN categorias ON tabela_produtos.id_categorias = categorias.id
    WHERE preco_custo > 20 ;

-- 18. Exibir o número total de produtos e a soma dos preços de custo para cada categoria
-- Selecione a quantidade de produtos e a soma dos valores da coluna `preco_custo`, agrupando pelos nomes das categorias.
SELECT categorias.nome, COUNT(tabela_produtos.id) AS total_produtos, SUM(tabela_produtos.preco_custo) AS total_custo 
	FROM tabela_produtos
    LEFT JOIN categorias ON tabela_produtos.id_categorias = categorias.id
    GROUP BY categorias.nome ;

-- 19. Exibir o produto mais caro de cada categoria junto com seu preço de custo
-- Selecione o produto com o maior valor de `preco_venda` em cada categoria e exiba também o valor de `preco_custo`.
SELECT categorias.nome, MAX(preco_venda) AS mais_caro FROM tabela_produtos
	JOIN categorias ON tabela_produtos.id_categorias = categorias.id
    GROUP BY categorias.nome
    ORDER BY tabela_produtos.preco_venda DESC LIMIT 1 ;

-- 20. Exibir o preço de venda dos produtos com o menor preço de custo para cada categoria
-- Selecione o menor valor da coluna `preco_custo` em cada categoria e exiba o preço de venda correspondente.
SELECT categorias.nome, MIN(preco_custo) AS menor_preco FROM tabela_produtos
	JOIN categorias ON tabela_produtos.id_categorias = categorias.id
    GROUP BY categorias.nome 
    ORDER BY tabela_produtos.preco_custo;
