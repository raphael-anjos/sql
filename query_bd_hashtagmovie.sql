-- Selecionando banco de dados como padrão
USE hashtagmovie;

-- Questão 01
-- Identifique a quantidade de linhas que existem para cada tabela. Esse check será importante para garantir que nenhuma informação está faltando.
SELECT * FROM alugueis; -- 578 linhas
SELECT * FROM atores;   -- 145 linhas
SELECT * FROM atuacoes; -- 213 linhas
SELECT * FROM clientes; -- 123 linhas
SELECT * FROM filmes;   -- 71 linhas

-- Questão 02
-- Pensando que as tabelas do SQL podem ter milhões de linhas, para fazer o reconhecimento de tabelas nem sempre é necessário visualizar todas as linhas, basta verificar as N primeiras linhas.
-- a) Utilize o comando LIMIT para visualizar apenas as 10 primeiras linhas da tabela de FILMES
SELECT
	*
FROM filmes
LIMIT 10;

-- b) Utilize o comando LIMIT para visualizar apenas as 50 primeiras linhas da tabela de CLIENTES
SELECT
	*
FROM clientes
LIMIT 50;

-- Questão 03
-- O responsável pela criação das tabelas disse que os filmes se dividem em um total de 7 GÊNEROS: 1) Comédia; 2) Drama; 3) Ficção e Fantasia; 4) Mistério e Suspense; 5) Arte; 6) Animação; 7) Ação e Aventura.
-- Nesse momento, você terá o IMPORTANTE trabalho de verificar se todos esses gêneros estão de fato presentes na tabela FILMES. Caso não esteja, você deverá reportar ao responsável.
SELECT
	DISTINCT genero
FROM filmes;

-- Questão 04
-- A empresa sabe que precisa expandir seu mercado para o máximo de estados possível. Como analista dos dados, você deverá identificar quais são os estados onde atualmente a empresa possui clientes. Quantos são esses estados no total? Pensando que o país tem 27 UF (26 estados + DF), ainda há espaço para expandir para quantos estados?

SELECT 
	DISTINCT estado
FROM clientes;

-- Questão 05
-- Faça uma análise em cima do ano de nascimento de cada um dos atores. Ordene a tabela de atores para mostrar os atores com os anos de nascimento do maior para o menor
SELECT
	*
FROM atores
ORDER BY ano_nascimento DESC;

-- Questão 06
-- O setor de controle de dados vai precisar fazer uma segmentação dos clientes, separando por ordem alfabética. Faça uma ordenação na tabela de clientes a partir da coluna nome_cliente para facilitar o trabalho dos seus colegas.
SELECT * FROM clientes
ORDER BY nome_cliente DESC;

-- Questão 07
-- Na tabela de clientes, tente descobrir qual foi o cliente com a data de criação de conta mais antiga, ou seja, o primeiro cliente cadastrado na base
SELECT * FROM clientes
ORDER BY data_criacao_conta
LIMIT 1;

-- Questão 08
-- A empresa gostaria de saber quais são os TOP 5 filmes com a maior duração. Você seria capaz de fazer essa análise?
SELECT * FROM filmes
ORDER BY duracao DESC
LIMIT 5;

-- Questão 09
-- A empresa deseja incluir em seu catálogo mais filmes do gênero de COMÉDIA. Para isso, ela deverá adquirir os direitos de transmissão junto ao estúdio responsável.
SELECT * FROM filmes
WHERE genero = "Comedia";

-- Questão 10
-- A equipe de estratégia fez um levantamento com os críticos de cinema mais conhecidos e descobriram que o ano de 2003 foi um dos anos de sucesso do cinema. Alguns desses críticos foram contratados para ajudar na melhoria do catálogo de filmes, e querem sugerir mais opções de filmes que foram lançados em 2003.
-- Para isso, os críticos contratados precisarão da lista de filmes que a empresa já tem, para que eles possam avaliar se esses filmes realmente são boas opções de se ter no catálogo, e também aproveitar para sugerir outros títulos.
-- O seu trabalho, portanto, é fazer uma consulta ao banco de dados para essa solicitação do projeto.
SELECT * FROM filmes
WHERE ano_lancamento = 2003;

-- Questão 11
-- Um dos analistas da equipe percebeu que alguns filmes do gênero Drama, com mais de 120 minutos de duração, não tinham uma boa avaliação dos clientes. Por isso, ele levantou a ideia de se analisar com mais cuidado todos os filmes que se enquadrassem nesses critérios, para verificar se de fato eles estão tendo um baixo rendimento.
-- O seu trabalho é listar todos esses filmes para que seja possível realizar essa análise
SELECT * FROM filmes
WHERE genero = "Drama" AND 	duracao >= 120;

-- Questão 12
-- A empresa está percebendo que os países do: Canadá, Austrália e Irlanda do Norte estão produzindo bons filmes nos últimos anos. Vendo esse movimento, a empresa decidiu listar todos os atores dessas nacionalidades para pesquisar filmes relacionados e avaliar a possibilidade de incluir mais opções no catálogo, referentes ao cinema desses 3 países.
-- O seu trabalho é listar todos os atores de nacionalidade: Canadá, Austrália e Irlanda do Norte para facilitar essa análise.
SELECT * FROM atores
WHERE nacionalidade IN ("Canadá", "Austrália", "Irlanda do Norte");

-- Questão 13
-- A empresa está percebendo que os países do: Canadá, Austrália e Irlanda do Norte estão produzindo bons filmes nos últimos anos. Vendo esse movimento, a empresa decidiu listar todos os atores dessas nacionalidades para pesquisar filmes relacionados e avaliar a possibilidade de incluir mais opções no catálogo, referentes ao cinema desses 3 países.
-- O seu trabalho é listar todos os atores de nacionalidade: Canadá, Austrália e Irlanda do Norte para facilitar essa análise.
SELECT * FROM filmes
WHERE duracao BETWEEN 90 AND 100;

-- Questão 14
-- A tabela de ALUGUEIS tem o registro de todos os aluguéis feitos no serviço de streaming da empresa
-- a) Descubra a quantidade total de alugueis de filmes feitos para todo o período (utilize a coluna id_aluguel para esse cálculo)
SELECT 
	COUNT(id_aluguel)
FROM alugueis;

-- b) Descubra a quantidade total de alugueis de filmes feitos para todo o período (utilize a coluna id_aluguel para esse cálculo)
SELECT 
	COUNT(nota)
FROM alugueis;

-- c) Você viu alguma diferença no resultado? O que aconteceu?
SELECT
	COUNT(*)
FROM alugueis;

-- Questão 15
-- O setor de catálogo precisa saber quantos gêneros de filmes existem na empresa atualmente. Você saberia fazer essa análise?
SELECT COUNT(DISTINCT genero)
FROM filmes;

-- Questão 16
-- Quantos minutos no total a empresa possui de filmes catalogados?
SELECT SUM(duracao)
FROM filmes;

-- Questão 17
-- Qual é a duração em minutos do filme mais longo disponível no catálogo? E qual a duração do filme mais curto?
SELECT
	MAX(duracao), -- 200 min
    MIN(duracao) -- 90 min
FROM filmes;    
-- Realizando JOIN para obter informações sobre titulo dos filmes e nome dos clientes que alugaram
SELECT
	alugueis.id_aluguel,
	clientes.nome_cliente,
    filmes.titulo,
    alugueis.nota,
    alugueis.data_aluguel,
    filmes.preco_aluguel
FROM alugueis
LEFT join clientes 
ON alugueis.id_cliente = clientes.id_cliente
LEFT JOIN filmes
ON alugueis.id_filme = filmes.id_filme
WHERE alugueis.nota <= 5;

-- Realizando JOIN para saber os protagonistas dos filmes
SELECT 
	atuacoes.id_protagonista,
    atores.nome_ator,
    filmes.titulo
FROM atuacoes
LEFT JOIN atores
ON atuacoes.id_ator = atores.id_ator
LEFT JOIN filmes
ON atuacoes.id_filme = filmes.id_filme;

-- Qual é a média de satisfação dos clientes da empresa em relação aos filmes alugados?
SELECT
	AVG(nota)
FROM alugueis;

-- JOIN que retorna quais filmes foram avaliados acima da média (no ano de 2003)
SELECT  
	alugueis.id_aluguel,
	filmes.titulo,
    filmes.ano_lancamento,
    alugueis.nota
FROM filmes
LEFT JOIN alugueis
ON alugueis.id_filme = filmes.id_filme
WHERE alugueis.nota > (SELECT AVG(alugueis.nota) FROM alugueis) AND filmes.ano_lancamento = 2003;
