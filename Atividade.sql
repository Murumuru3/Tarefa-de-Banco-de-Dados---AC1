-- create
CREATE TABLE EMPLOYEE (
  empId IDENTITY INT PRIMARY KEY,
  name TEXT NOT NULL,
  dept TEXT NOT NULL
);

-- insert
INSERT INTO EMPLOYEE VALUES ('Clark', 'Sales');
INSERT INTO EMPLOYEE VALUES ('Dave', 'Accounting');
INSERT INTO EMPLOYEE VALUES ('Ava', 'Sales');

-- fetch 
SELECT * FROM EMPLOYEE WHERE dept = 'Sales';

 --  3. Alteração de tipo de dados _ _ _
ALTER TABLE Classe
ALTER COLUMN Caracteristicas VARCHAR(1500);

--  4. Exclusão de tipo de dado_ _ _ 
ALTER TABLE raca
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


-- 6. Atualização de Dados

UPDATE Classe
SET Caracteristicas = 'Descrição não informada'
WHERE Caracteristicas IS NULL;
