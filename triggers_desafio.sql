use ecommerce;


-- Triggers de Remoção (Before Delete)
DELIMITER //

CREATE TRIGGER before_delete_client
BEFORE DELETE ON clients
FOR EACH ROW
BEGIN
    DELETE FROM orders WHERE idOrderClient = OLD.idClient;
END;

//

DELIMITER ;


-- Trigger para Remover Fornecedor (Cascata para Produtos Relacionados)

DELIMITER //

CREATE TRIGGER before_delete_supplier
BEFORE DELETE ON supplier
FOR EACH ROW
BEGIN
    DELETE FROM productSupplier WHERE idPsSupplier = OLD.idSupplier;
END;

//

DELIMITER ;

-- Triggers de Atualização (Before Update)
DELIMITER //

CREATE TRIGGER before_update_seller_salary
BEFORE UPDATE ON seller
FOR EACH ROW
BEGIN
    IF NEW.location <> OLD.location THEN
        -- Adicionar lógica de atualização do salário base aqui
        -- Exemplo: NEW.baseSalary = NEW.baseSalary * 1.1; (aumento de 10% se a localização mudar)
	END IF;
END;

//

DELIMITER ;

-- Trigger para inserir novos colaboradores:

DELIMITER //

CREATE TRIGGER before_insert_employee
BEFORE INSERT ON employee
FOR EACH ROW
BEGIN
    -- Adicionar lógica de inserção para novos colaboradores aqui
    -- Exemplo: INSERT INTO log_employee_insert VALUES (NEW.Ssn, NOW());
END;

//

DELIMITER ;



