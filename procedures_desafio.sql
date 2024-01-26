-- procedures para o banco de dados ecommerce2;
use ecommerce2;

-- criando procedures para o cenario de ecommerce2

DELIMITER //

CREATE PROCEDURE ManageECommerceData(
    IN action INT,
    IN idProduct INT,
    IN newName VARCHAR(255),
    IN newCategory ENUM('Eletrônico','Vestimenta','Brinquedos','Alimentos','Móveis'),
    IN newAvaliacao FLOAT,
    IN newSize VARCHAR(10)
)
BEGIN
    CASE action
        WHEN 1 THEN -- Select
            SELECT * FROM product WHERE idProduct = idProduct;
        WHEN 2 THEN -- Update
            UPDATE product
            SET
                Pname = newName,
                category = newCategory,
                avaliacao = newAvaliacao,
                size = newSize
            WHERE idProduct = idProduct;
        WHEN 3 THEN -- Delete
            DELETE FROM product WHERE idProduct = idProduct;
        ELSE -- Insert
            INSERT INTO product (Pname, classification_kids, category, avaliacao, size)
            VALUES (newName, false, newCategory, newAvaliacao, newSize);
    END CASE;
END //

DELIMITER ;

-- Para a Universidade
CALL ManageUniversityData(1, 1, '', '', '', 0); -- Select
CALL ManageUniversityData(2, 1, 'NewName', 'NewAddress', 'NewCourse', 9.0); -- Update
CALL ManageUniversityData(3, 1, '', '', '', 0); -- Delete
CALL ManageUniversityData(4, 0, 'John Doe', '123 Main St', 'Computer Science', 8.5); -- Insert

-- Para o E-commerce
CALL ManageECommerceData(1, 1, '', '', 0, ''); -- Select
CALL ManageECommerceData(2, 1, 'NewName', 'Eletrônico', 4.5, 'Medium'); -- Update
CALL ManageECommerceData(3, 1, '', '', 0, ''); -- Delete
CALL ManageECommerceData(4, 0, 'Product A', 'Eletrônico', 3.5, 'Small'); -- Insert


