# 1- Qual a média de tempo (em segundos) de duração do aluguel de bike por tipo de membro?
SELECT 	tipo_membro,
		avg(duracao_segundos) as media_tempo
FROM cap06.tb_bikes2
GROUP BY tipo_membro;

# 2- Qual a média de tempo (em segundos) de duração do aluguel de bike por tipo de membro e 
#por estação fim (onde as bikes são entregues após o aluguel)?
SELECT 	estacao_fim,
		tipo_membro,
		avg(duracao_segundos) as media_tempo
FROM cap06.tb_bikes2
GROUP BY estacao_fim, tipo_membro
ORDER BY estacao_fim;

# 3- Qual a média de tempo (em segundos) de duração do aluguel de bike por tipo de membro e 
#por estação fim (onde as bikes são entregues após o aluguel) ao longo do tempo?
SELECT 	estacao_fim,
		tipo_membro,
		avg(duracao_segundos) OVER (partition by estacao_fim, tipo_membro  ORDER BY data_inicio) as media_tempo
FROM cap06.tb_bikes2;

# 4- Qual hora do dia (independente do mês) a bike de número W01182 teve o maior número de 
#aluguéis considerando a data de início?
SELECT  EXTRACT(HOUR FROM data_inicio) as Hora, 
		COUNT(*) as total_aluguel
FROM cap06.tb_bikes2
WHERE numero_bike = 'W01182'
GROUP BY Hora
ORDER BY total_aluguel DESC;

# 5- Qual o número de aluguéis da bike de número W01182 ao longo do tempo considerando a 
#data de início?
SELECT  CAST(data_inicio as date) as data_inicio,
		COUNT(duracao_segundos) OVER (Partition by estacao_inicio ORDER BY CAST(data_inicio as date)) as contagem
FROM cap06.tb_bikes2
WHERE numero_bike = 'W01182';

# 6- Retornar:
# Estação fim, data fim de cada aluguel de bike e duração de cada aluguel em segundos
# Número de aluguéis de bikes (independente da estação) ao longo do tempo 
# Somente os registros quando a data fim foi no mês de Abril
SELECT  estacao_fim,
		CAST(data_fim as date) as data_fim,
        duracao_segundos,
        COUNT(duracao_segundos) OVER (ORDER BY data_fim) as Numero_alugueis
FROM cap06.tb_bikes2
WHERE MONTH(data_fim) = 4;

# 7- Retornar:
# Estação fim, data fim e duração em segundos do aluguel 
# A data fim deve ser retornada no formato: 01/January/2012 00:00:00
# Queremos a ordem (classificação ou ranking) dos dias de aluguel ao longo do tempo
# Retornar os dados para os aluguéis entre 7 e 11 da manhã
SELECT  estacao_fim,
		DATE_FORMAT(data_fim, '%d/%M/%Y %T') as data_fim,
        duracao_segundos,
        DENSE_RANK() OVER (PARTITION BY estacao_fim ORDER BY CAST(data_fim as date)) as Ranking_aluguel
FROM cap06.tb_bikes2
WHERE HOUR(data_fim) BETWEEN 07 AND 11;

# 8- Qual a diferença da duração do aluguel de bikes ao longo do tempo, de um registro para 
#outro, considerando data de início do aluguel e estação de início?
# A data de início deve ser retornada no formato: Sat/Jan/12 00:00:00 (Sat = Dia da semana 
#abreviado e Jan igual mês abreviado). Retornar os dados para os aluguéis entre 01 e 03 da manhã
SELECT  DATE_FORMAT(data_inicio, '%a/%b/%y %T') as Data_inic,
        duracao_segundos,
        duracao_segundos - LAG(duracao_segundos, 1) OVER (PARTITION BY estacao_inicio ORDER BY CAST(data_inicio as date)) as diferenca
FROM cap06.tb_bikes2
WHERE HOUR(data_inicio) BETWEEN 01 AND 03;

# 9- Retornar:
# Estação fim, data fim e duração em segundos do aluguel 
# A data fim deve ser retornada no formato: 01/January/2012 00:00:00
# Queremos os registros divididos em 4 grupos ao longo do tempo por partição
# Retornar os dados para os aluguéis entre 8 e 10 da manhã
# Qual critério usado pela função NTILE para dividir os grupos?
SELECT  estacao_fim,
		DATE_FORMAT(data_fim, '%d/%M/%Y %T') as data_fim,
        duracao_segundos,
        NTILE(4) OVER (PARTITION BY estacao_fim ORDER BY CAST(data_fim as date)) as Divisao_grupo
FROM cap06.tb_bikes2
WHERE HOUR(data_fim) BETWEEN 08 AND 10;

# 10- Quais estações tiveram mais de 35 horas de duração total do aluguel de bike ao longo do 
#tempo considerando a data fim e estação fim?
# Retorne os dados entre os dias '2012-04-01' e '2012-04-02'
# Dica: Use função window e subquery
SELECT estacao_fim, duracao_total
FROM	(SELECT  estacao_fim,
				DATE_FORMAT(data_fim, '%Y-%m-%d') as data_fim,
				SUM(duracao_segundos/60/60) OVER (PARTITION BY estacao_fim ORDER BY CAST(data_fim as date)) as duracao_total
		FROM cap06.tb_bikes2
		WHERE DATE_FORMAT(data_fim, '%Y-%m-%d') BETWEEN '2012-04-01' AND '2012-04-02') as resultado
WHERE duracao_total > 35;
