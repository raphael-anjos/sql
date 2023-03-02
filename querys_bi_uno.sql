#################################### FATURAMENTO #####################################################################################################
SET @mes =  MONTH(CURDATE());
SET @ano =  YEAR(CURDATE());
SELECT SUM(valor.Faturamento)
FROM
(SELECT 
		(itemNf.qtd * itemNf.preco_venda_original) AS 'Faturamento'			
FROM
vd_nota_fiscal_item AS itemNf
LEFT JOIN vd_nota_fiscal AS nf
ON itemNf.cod_nota_fiscal = nf.cod_nota_fiscal
JOIN vd_pedido AS ped ON ped.cod_pedido = itemNf.cod_pedido
JOIN cd_nop ON cd_nop.nop = nf.nop
-- JOIN sg_colaborador AS cad_revenda ON cad_revenda.cod_colaborador = ped.cod_revenda
-- LEFT JOIN plug_class_revenda ON plug_class_revenda.NOME_REVENDA = cad_revenda.nome_colaborador
WHERE YEAR(nf.dt_emissao) = @ano  AND MONTH(nf.dt_emissao )= @mes-1 AND nf.situacao = 80 AND cd_nop.ind_estatistica_venda = 1)  AS valor 
#####################################################################################################################################################

#################################### TOP 5 ESTADOS ##################################################################################################
SET @mes =  MONTH(CURDATE());
SET @ano =  YEAR(CURDATE());
SELECT 
	estado,
	SUM(valor.Faturamento)
FROM
(SELECT 
		nf.sigla_uf AS estado
		,(itemNf.qtd * itemNf.preco_venda_original) AS 'Faturamento'
		
FROM
vd_nota_fiscal_item AS itemNf
LEFT JOIN vd_nota_fiscal AS nf
ON itemNf.cod_nota_fiscal = nf.cod_nota_fiscal
JOIN vd_pedido AS ped ON ped.cod_pedido = itemNf.cod_pedido
JOIN cd_nop ON cd_nop.nop = nf.nop
JOIN sg_colaborador AS cad_revenda ON cad_revenda.cod_colaborador = nf.cod_revenda
-- LEFT JOIN plug_class_revenda ON plug_class_revenda.NOME_REVENDA = cad_revenda.nome_colaborador
WHERE YEAR(nf.dt_emissao) = @ano  AND MONTH(nf.dt_emissao )= @mes-1 AND nf.situacao = 80 AND cd_nop.ind_estatistica_venda = 1) AS valor
GROUP BY estado
ORDER BY SUM(Faturamento) DESC
LIMIT 5 ;

#####################################################################################################################################################

#################################### TOP 5 REVENDAS ##################################################################################################
SET @mes =  MONTH(CURDATE());
SET @ano =  YEAR(CURDATE());
SELECT 
	estado,
	SUM(valor.Faturamento)
FROM
(SELECT 
		cad_revenda.nome_colaborador AS nome_revenda
		,(itemNf.qtd * itemNf.preco_venda_original) AS 'Faturamento'
		
FROM
vd_nota_fiscal_item AS itemNf
LEFT JOIN vd_nota_fiscal AS nf
ON itemNf.cod_nota_fiscal = nf.cod_nota_fiscal
JOIN vd_pedido AS ped ON ped.cod_pedido = itemNf.cod_pedido
JOIN cd_nop ON cd_nop.nop = nf.nop
JOIN sg_colaborador AS cad_revenda ON cad_revenda.cod_colaborador = nf.cod_revenda
-- LEFT JOIN plug_class_revenda ON plug_class_revenda.NOME_REVENDA = cad_revenda.nome_colaborador
WHERE YEAR(nf.dt_emissao) = @ano  AND MONTH(nf.dt_emissao )= @mes-1 AND nf.situacao = 80 AND cd_nop.ind_estatistica_venda = 1) AS valor
GROUP BY nome_revenda
ORDER BY SUM(Faturamento) DESC
LIMIT 5 ;

#####################################################################################################################################################


#################################### FATURAMENTO POR VENDEDORES ##################################################################################################
SET @mes =  MONTH(CURDATE());
SET @ano =  YEAR(CURDATE());
SELECT 
	nome_vendedor,
	SUM(valor.Faturamento)
FROM
(SELECT
		cad_revenda.nome_colaborador AS nome_vendedor
		,(itemNf.qtd * itemNf.preco_venda_original) * comissao.perc_participacao  AS Faturamento
		

		
FROM
vd_nota_fiscal_item AS itemNf
JOIN vd_nota_fiscal AS nf ON itemNf.cod_nota_fiscal = nf.cod_nota_fiscal
LEFT  JOIN vd_pedido_comissao AS comissao ON comissao.cod_pedido = itemNf.cod_pedido
JOIN sg_colaborador AS cad_revenda ON cad_revenda.cod_colaborador = comissao.cod_colaborador
WHERE YEAR(nf.dt_emissao) = @ano  AND MONTH(nf.dt_emissao )= @mes-1 AND nf.situacao = 80 AND comissao.tp_owner = 1) AS valor
GROUP BY  nome_vendedor
ORDER BY SUM(Faturamento) DESC
-- LIMIT 5;

#####################################################################################################################################################

#################################### TOP 5 FAM.COMERCIAL ##################################################################################################
SET @mes =  MONTH(CURDATE());
SET @ano =  YEAR(CURDATE());
SELECT 
	familia_comercial,
	SUM(valor.Faturamento)
FROM
(SELECT 
		cd_familia_comercial.desc_abrev AS familia_comercial
		,(itemNf.qtd * itemNf.preco_venda_original) AS 'Faturamento'
		
FROM
vd_nota_fiscal_item AS itemNf
LEFT JOIN vd_nota_fiscal AS nf
ON itemNf.cod_nota_fiscal = nf.cod_nota_fiscal
JOIN vd_pedido AS ped ON ped.cod_pedido = itemNf.cod_pedido
JOIN cd_nop ON cd_nop.nop = nf.nop
JOIN sg_colaborador AS cad_revenda ON cad_revenda.cod_colaborador = nf.cod_revenda
JOIN cd_produto AS prod ON prod.cod_produto = itemNf.cod_produto
JOIN cd_familia_comercial ON cd_familia_comercial.cod_familia_comercial = prod.cod_familia_comercial
WHERE YEAR(nf.dt_emissao) = @ano  AND MONTH(nf.dt_emissao )= @mes-1 AND nf.situacao = 80 AND cd_nop.ind_estatistica_venda = 1) AS valor
GROUP BY familia_comercial
ORDER BY SUM(Faturamento) DESC
LIMIT 5 ;

#####################################################################################################################################################
