# 🚴‍♂️ Análise de Dados: Capital Bikeshare Trip Data

## 🌟 Visão Geral

Este projeto foca na análise do dataset "2012Q2-capitalbikeshare-tripdata.csv", que contém informações sobre aluguéis de bicicletas em Washington, D.C. O objetivo é extrair insights sobre o uso das bicicletas, considerando diferentes parâmetros como tipo de membro, estações de entrega e períodos de tempo. Os dados foram extraídos do site da [Capital Bikeshare](https://capitalbikeshare.com/).

## 📊 Perguntas a serem Respondidas

Neste projeto, vamos explorar as seguintes perguntas:

1. Qual a média de tempo (em segundos) de duração do aluguel de bike por tipo de membro?
2. Qual a média de tempo (em segundos) de duração do aluguel de bike por tipo de membro e por estação fim (onde as bikes são entregues após o aluguel)?
3. Como a média de tempo (em segundos) de duração do aluguel varia por tipo de membro e por estação fim ao longo do tempo?
4. Qual hora do dia (independente do mês) a bike de número W01182 teve o maior número de aluguéis considerando a data de início?
5. Qual o número de aluguéis da bike de número W01182 ao longo do tempo considerando a data de início?
6. Retornar:
   - Estação fim, data fim de cada aluguel de bike e duração de cada aluguel em segundos.
   - Número de aluguéis de bikes (independente da estação) ao longo do tempo.
   - Somente os registros quando a data fim foi no mês de Abril.
7. Retornar:
   - Estação fim, data fim e duração em segundos do aluguel.
   - A data fim deve ser retornada no formato: 01/January/2012 00:00:00.
   - Queremos a ordem (classificação ou ranking) dos dias de aluguel ao longo do tempo.
   - Retornar os dados para os aluguéis entre 7 e 11 da manhã.
8. Qual a diferença da duração do aluguel de bikes ao longo do tempo, de um registro para outro, considerando data de início do aluguel e estação de início?
   - A data de início deve ser retornada no formato: Sat/Jan/12 00:00:00 (Sat = Dia da semana abreviado e Jan igual mês abreviado).
   - Retornar os dados para os aluguéis entre 01 e 03 da manhã.
9. Retornar:
   - Estação fim, data fim e duração em segundos do aluguel.
   - A data fim deve ser retornada no formato: 01/January/2012 00:00:00.
   - Queremos os registros divididos em 4 grupos ao longo do tempo por partição.
   - Retornar os dados para os aluguéis entre 8 e 10 da manhã.
   - Qual critério foi usado pela função NTILE para dividir os grupos?
10. Quais estações tiveram mais de 35 horas de duração total do aluguel de bike ao longo do tempo considerando a data fim e estação fim?
    - Retorne os dados entre os dias '2012-04-01' e '2012-04-02'.

## 🗂️ Como Começar

1. **Download do Dataset**: 
   - Obtenha o arquivo "2012Q2-capitalbikeshare-tripdata.csv" do site da [Capital Bikeshare](https://s3.amazonaws.com/capitalbikeshare-data/index.html), são dados de livre acesso, basta escolher o ano para análise no meu caso escolhi o ano 2012Q2.

2. **Carregamento dos Dados**: 
   - Carregue o arquivo em uma nova tabela no seu banco de dados de escolha.

3. **Análise de Dados**: 
   - Utilize SQL para responder às perguntas propostas. Construa suas consultas de forma a obter os insights necessários de forma clara e eficaz.

## 🛠️ Tecnologias Utilizadas

- **Banco de Dados Relacional**: MySQL, PostgreSQL, ou similar.
- **Linguagem de Consulta**: SQL.

## 📈 Expectativas

Este projeto não só lhe ajudará a praticar suas habilidades em SQL, mas também a entender melhor a dinâmica do uso das bicicletas na cidade, permitindo que você extraia informações significativas a partir de dados brutos.

## 🤝 Contribuição

Sinta-se à vontade para contribuir! Sugestões, correções e melhorias são sempre bem-vindas.