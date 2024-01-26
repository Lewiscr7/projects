



-- README.md
-- Projeto: [Nome do Projeto]
-- Descrição: [Breve descrição do projeto]
-- Motivação dos índices: [Explique brevemente por que você escolheu criar esses índices]

-- Criação do índice para a pergunta 1 usando hash
CREATE INDEX idx_employee_Dno_hash ON employee(Dno) USING HASH;

-- Criação do índice para a pergunta 2 usando hash
CREATE INDEX idx_dept_locations_Dnumber_hash ON dept_locations(Dnumber) USING HASH;

-- Consulta para a pergunta 1
SELECT Dname, COUNT(*) as TotalEmployees
FROM department
JOIN employee ON department.Dnumber = employee.Dno
GROUP BY Dname
ORDER BY TotalEmployees DESC
LIMIT 1;

-- Consulta para a pergunta 2
SELECT Dname, Dlocation
FROM department
JOIN dept_locations ON department.Dnumber = dept_locations.Dnumber;

-- Consulta para a pergunta 3
SELECT Dname, COUNT(*) as TotalEmployees
FROM department
JOIN employee ON department.Dnumber = employee.Dno
GROUP BY Dname;

/*  Nesse exemplo, utilizei USING HASH na criação dos índices idx_employee_Dno_hash e idx_dept_locations_Dnumber_hash para indicar o uso da função de hash. 
Certifique-se de entender as implicações de usar índices hash, pois eles têm benefícios e desvantagens específicos em comparação com índices padrão 

-- Para otimizar essa consulta, o índice criado anteriormente (idx_employee_Dno) pode ser útil. Não é necessário criar um novo índice para esta consulta.
/*

