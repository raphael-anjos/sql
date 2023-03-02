SELECT SUM(item.preco_venda_original * item.qtd) AS Faturamento, situacao.descricao FROM vd_pedido_item AS item
LEFT JOIN vd_pedido AS pedido 
ON pedido.cod_pedido = item.cod_pedido
LEFT JOIN vd_ponto_controle AS situacao 
ON pedido.situacao = situacao.cod_controle
WHERE MONTH (pedido.dt_alteracao) = MONTH(NOW()) AND pedido.situacao IN (7,13,30,55,61)
GROUP BY pedido.situacao;


SELECT COUNT(pedido.cod_pedido) AS Faturamento, pedido.situacao, situacao.descricao FROM vd_pedido_item AS item
LEFT JOIN vd_pedido AS pedido 
ON pedido.cod_pedido = item.cod_pedido
LEFT JOIN vd_ponto_controle AS situacao 
ON pedido.situacao = situacao.cod_controle
WHERE MONTH (pedido.dt_alteracao) = MONTH(NOW()) AND pedido.situacao IN (7,13,30,55,61)
GROUP BY pedido.situacao;
