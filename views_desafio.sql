-- 1 Número de empregados por departamento e localidade:

CREATE VIEW emp_count_by_dept_loc AS
SELECT Dno, Dlocation, COUNT(*) AS emp_count
FROM employee
GROUP BY Dno, Dlocation;

-- 2 Lista de departamentos e seus gerentes:

CREATE VIEW dept_managers AS
SELECT D.Dnumber, D.Dname, E.Fname AS Manager_FirstName, E.Lname AS Manager_LastName
FROM department D
JOIN employee E ON D.Mgr_ssn = E.Ssn;

-- 3 Projeto com maior número de empregados:

CREATE VIEW projects_with_most_employees AS
SELECT Pname, Pnumber, COUNT(Essn) AS num_employees
FROM works_on
JOIN project ON works_on.Pno = project.Pnumber
GROUP BY Pname, Pnumber
ORDER BY num_employees DESC;

-- 4 lista de projetos, departamentos e gerentes

CREATE VIEW projects_departments_managers AS
SELECT project.Pname, project.Pnumber, department.Dname, employee.Fname AS Manager_FirstName, employee.Lname AS Manager_LastName
FROM project
JOIN department ON project.Dnum = department.Dnumber
JOIN employee ON department.Mgr_ssn = employee.Ssn;

-- 5 Quais empregados possuem dependentes e se são gerentes:

CREATE VIEW employees_with_dependents_and_managers AS
SELECT E.*, D.Dependent_name, D.Relationship
FROM employee E
LEFT JOIN dependent D ON E.Ssn = D.Essn
WHERE E.Ssn IN (SELECT Mgr_ssn FROM department);

-- Permissões para o usuário 'gerente'
GRANT SELECT ON emp_count_by_dept_loc TO gerente;
GRANT SELECT ON dept_managers TO gerente;
GRANT SELECT ON projects_with_most_employees TO gerente;
GRANT SELECT ON projects_departments_managers TO gerente;
GRANT SELECT ON employees_with_dependents_and_managers TO gerente;

-- Permissões para o usuário 'employee'
GRANT SELECT ON employee TO employee;















