/*
Tarefa de Banco de Dados - AC1
Grupo G1 - TIN1.
Integrantes + Questão que resolveu
Ana Paula Alves Vieira (3 e 4)
Gabriel Kiyoshi Hasshimoto (1 e 2)
Jonathan Nascimento do Prado (7)
Lucas Santana Souza (8 e 9)
Mayar Ballan (10)
Roni Santos Silva Júnior (5 e 6)
 (
*/

-- 1. Criação das tabelas (A FAZER)
CREATE TABLE EMPLOYEE (
  empId IDENTITY INT PRIMARY KEY,
  name TEXT NOT NULL,
  dept TEXT NOT NULL
);


 --  3. Alteração de tipo de dados
ALTER TABLE Classe
ALTER COLUMN Caracteristicas VARCHAR(1500);

--  4. Exclusão de campo
ALTER TABLE raca
DROP COLUMN perdido;

-- 7. Atualização de dados
UPDATE Personagem
SET Poder += 10
WHERE IDClasse IN
(
SELECT IDClasse
FROM Classe
WHERE Nome = 'Guerreiro'
);

-- 8. Atualização de dados
UPDATE Raca
SET Descricao = 'Raca revisada pela guilda dos historiadores.',
Origem = 'Terras Antigas'
WHERE Origem = 'Terras Antigas do Norte';

-- 9. Exclusão de Registros
Delete FROM Personagem
WHERE YEAR (Datadenascimento) >= 1970
AND <= 1990;
