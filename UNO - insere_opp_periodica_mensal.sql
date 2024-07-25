
INSERT INTO at_oportunidade (cod_oportunidade, cod_cliente, cod_tp_aplicacao, cod_fornecedor, cod_colaborador,cod_revenda,	
							tb_preco, cod_contato, cod_origem, cod_origem_pedido,cod_cond_pagto,cod_familia_comercial,	
							cod_status, descricao,dt_abertura, dt_deadline, telefone, dt_status, ddd, tp_oportunidade, 
							periodicidade,vl_estimado,nop, moeda)	
							SELECT (SELECT MAX(cod_oportunidade)+1 FROM at_oportunidade)AS opp,plano.cod_cliente, 2, 11743, 
									plano.cod_colaborador,	cli.cod_revenda_gerado, plano.tb_preco, plano.cod_contato, 50, 10, 
									plano.cod_cond_pagto, 39, 107, plano.descricao,	 '2023-04-05', '2023-04-30', plano.telefone,'2023-04-05', 
									plano.ddd, 1, 30,plano.vl_total_plano ,plano.nop,'R$'	
							FROM sv_plano_servico AS plano LEFT JOIN cd_cliente AS cli ON cli.cod_cliente = plano.cod_cliente	
							WHERE plano.cod_plano = 93

									  		
 							  


								    