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
*/

-- 1. Criação das tabelas
CREATE TABLE Raca(
 IDRaca int primary key identity,
 Nome varchar(100) not null,
 Descricao varchar(500),
 Origem varchar(150) not null,
 Perdido datetime
);

CREATE TABLE Habilidade(
 IDHabilidade int primary key identity,
 Nome varchar(200) not null,
 MultiplicadorPoder int
);

CREATE TABLE Classe(
 IDClasse int primary key identity,
 Nome varchar(100) not null,
 Caracteristicas varchar(1000),
 IDHabilidade int not null references Habilidade(IDHabilidade)
);

CREATE TABLE Personagem(
 IDPersonagem int primary key identity,
 Nome varchar(100) not null,
 Descricao varchar(500),
 DataNascimento datetime not null,
 IDRaca int not null references Raca(IDRaca),
 IDClasse int not null references Classe(IDClasse)
);

-- 2. Adição de campo
ALTER TABLE Personagem add Poder int not null;

 --  3. Alteração de tipo de dados
ALTER TABLE Classe
ALTER COLUMN Caracteristicas VARCHAR(1500);

--  4. Exclusão de campo
ALTER TABLE Raca
DROP COLUMN perdido;

-- 5. Inserção de Dados
-- Habilidade
INSERT INTO Habilidade (Nome, MultiplicadorPoder)
VALUES ('Visão Aguçada', 2);

INSERT INTO Habilidade (Nome, MultiplicadorPoder)
VALUES ('Fúria', 3);

INSERT INTO Habilidade (Nome, MultiplicadorPoder)
VALUES ('Cura Mística', 4);


-- Classe
INSERT INTO Classe (Nome, Caracteristicas, IDHabilidade)
SELECT 'Arqueiro', 'Especialista em ataques à distância.', H.IDHabilidade
FROM Habilidade H
WHERE H.Nome = 'Visão Aguçada';

INSERT INTO Classe (Nome, Caracteristicas, IDHabilidade)
SELECT 'Guerreiro', 'Especialista em combate corpo a corpo.', H.IDHabilidade
FROM Habilidade H
WHERE H.Nome = 'Fúria';

INSERT INTO Classe (Nome, Caracteristicas, IDHabilidade)
SELECT 'Mago', 'Especialista em magia.', H.IDHabilidade
FROM Habilidade H
WHERE H.Nome = 'Cura Mística';

-- Raça
INSERT INTO Raca (Nome, Descricao, Origem)
VALUES ('Elfo', 'Raça ágil e habilidosa.', 'Floresta Encantada');

INSERT INTO Raca (Nome, Descricao, Origem)
VALUES ('Anão', 'Raça forte e resistente.', 'Montanhas Antigas');

INSERT INTO Raca (Nome, Descricao, Origem)
VALUES ('Humano', 'Raça versátil e adaptável.', 'Terras Antigas');

-- Personagem
INSERT INTO Personagem
(Nome, Descricao, DataNascimento, IDRaca, IDClasse, Poder)
VALUES ('Legolas', 'Arqueiro élfico.', '1995-05-10', 1, 1, 80);

INSERT INTO Personagem
(Nome, Descricao, DataNascimento, IDRaca, IDClasse, Poder)
VALUES ('Thorin', 'Guerreiro anão.', '1965-08-20', 2, 2, 90);

INSERT INTO Personagem
(Nome, Descricao, DataNascimento, IDRaca, IDClasse, Poder)
VALUES ('Arion', 'Mago humano.', '2000-03-15', 3, 3, 85);

-- 6. Atualização de dados (1/3)

UPDATE Classe
SET Caracteristicas = 'Descrição não informada'
WHERE Caracteristicas IS NULL;

-- 7. Atualização de dados (2/3)
UPDATE Personagem
SET Poder += 10
WHERE IDClasse IN
(
SELECT IDClasse
FROM Classe
WHERE Nome = 'Guerreiro'
);

-- 8. Atualização de dados (3/3)
UPDATE Raca
SET Descricao = 'Raca revisada pela guilda dos historiadores.',
Origem = 'Terras Antigas do Norte'
WHERE Origem = 'Terras Antigas';

--9 Exclusão de registros (1/2)
DELETE FROM Personagem 
 WHERE YEAR (DataNascimento) >= 1970
 AND YEAR (DataNascimento) <= 2000;

-- 10. Exclusão de registros (2/2).
delete from Personagem where IDClasse in (select IDClasse from Classe where IDHabilidade in (select IDHabilidade from Habilidade where MultiplicadorPoder < 3))
delete from Classe where IDHabilidade in (select IDHabilidade from Habilidade where MultiplicadorPoder < 3)
delete from Habilidade where MultiplicadorPoder < 2
