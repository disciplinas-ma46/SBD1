
# Escolhendo modelo para recuperação de banco de dados

- modelo de recuperação completa
    opcionalmente suplementado por
    - modelo de recuperação bulk-logged
    Obs: se as transações foram marcadas em cada um dos BD relacionados,
         você pode recuperar o BD até um ponto consistente
         Isso exige a restauração de cada um dos bancos de dados com a mesma marca de transação do ponto de recuperação. 
         usar marca para um ponto de restautação acarreta na perda de qualquer transação confirmada 

- modelo de recuperação simples
    apropriado para um banco de dados de produção pequena

ao escolher, considerar as metas de recuperação

## Identificando metas e requisitos de recuperação

Qual a importância de nunca perder uma alteração?
Seria fácil recriar dados perdidos?
Você tem dois ou mais bancos de dados que devem ser logicamente consistentes?

se sim, considere o uso de transações do MS DTC (Coordenador de Transações Distribuídas da Microsoft)


> Considerações sobre pessoal

Sua organização usa administradores de sistema ou de banco de dados? Caso não use, quem será responsável pela execução de operações de backup e recuperação, e como os indivíduos serão treinados?

## Padrões de uso de Dados

Para cada banco de dados, considere as seguintes perguntas:

* Com que freqüência são alterados os dados no banco de dados?
* Algumas tabelas são modificadas significativamente com mais freqüência que outras?
* Há períodos de produção críticos? Se houver, quais serão os padrões de uso durante esses períodos? O banco de dados tem períodos de pico para inserção e outras operações de atualização?

É aconselhável programar backups em horas de pouca atividade.
Quando o sistema de E/S está em uso, é aconselhável somente backup de log