-- Resolução de exercicios - Intesivão SQL Hastag Programação
-- Questão 1. 
-- É o seu primeiro dia como analista no projeto e você precisa visualizar as informações das empresas. Mas o que dão pra você é um banco de dados no MySQL e o famoso: SE VIRA! Selecione TODAS AS COLUNAS da tabela RESULTADOS do banco EMPRESAS.
SELECT * FROM resultados;

-- Questão 2
-- Seu gerente achou que tinha muita informação pensando na demanda que ele queria naquele momento. Por isso, ele te pediu para alterar essa consulta ao banco de dados para mostrar apenas a coluna de nome das empresas.
SELECT 
	nome 
FROM resultados;

-- Questão 3
-- O setor de RH precisa fazer uma análise das empresas, e pediu a você que selecione APENAS as colunas id_empresa, nome, setor e num_funcionarios. Como resolver isso?
SELECT 
	id_empresa, 
    nome, 
    setor, 
    num_funcionarios 
FROM resultados;

-- Questão 4
-- O setor Financeiro precisa fazer uma análise das empresas, e pediu a você que selecione APENAS as colunas id_empresa, nome, setor e receitas. Obs: Dê um novo nome para cada coluna da query resultante.
SELECT 
	id_empresa,
    nome,
    setor,
    receitas
FROM resultados;

-- Questão 5
-- Sua empresa está fazendo um estudo de mercado e precisa saber quais empresas atuam em cada um desses dois setores: Tecnologia e Energia. Você consegue descobrir qual dos dois setores possui mais players?
SELECT
		COUNT(setor) AS "Empresas de Energia"        
FROM resultados
WHERE setor = "Energia"; -- TECNOLOGIA 43 / ENERGIA 57

-- Questão Extra
-- Uma ultima solicitação foi realizada, seu gerente precisa de uma lista de empresas que não estão dando lucro 
SELECT
	nome,
    setor,
    receitas,
    lucros
 FROM resultados
 WHERE lucros < 0; 