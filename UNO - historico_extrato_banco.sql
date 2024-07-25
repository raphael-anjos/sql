SELECT @hist := MAX(seq_hist_extrato)+1 FROM fn_extrato_historico;

INSERT INTO fn_extrato_historico (nr_banco, seq_hist_extrato, historico, descricao, tp_acao, ind_estorno) 
VALUES (341,@hist,' ADIANT DEPOSITANTE DD / MM',' Encargos de Juros devido a utilização do Lis Adicional',2,0)

