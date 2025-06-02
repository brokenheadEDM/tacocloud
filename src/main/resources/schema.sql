-- 1) 외래키 제약 해제 및 기존 테이블 모두 삭제
SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS taco_ingredients;
DROP TABLE IF EXISTS Ingredient_Ref;
DROP TABLE IF EXISTS Taco;
DROP TABLE IF EXISTS Ingredient;
DROP TABLE IF EXISTS Taco_Order;
SET FOREIGN_KEY_CHECKS = 1;

-- 2) Taco_Order 테이블 생성
CREATE TABLE IF NOT EXISTS Taco_Order (
                                          id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                          delivery_name VARCHAR(50) NOT NULL,
    delivery_street VARCHAR(50) NOT NULL,
    delivery_city VARCHAR(50) NOT NULL,
    delivery_state VARCHAR(2) NOT NULL,
    delivery_zip VARCHAR(10) NOT NULL,
    cc_number VARCHAR(16) NOT NULL,
    cc_expiration VARCHAR(5) NOT NULL,
    cc_cvv VARCHAR(3) NOT NULL,
    placed_at TIMESTAMP NOT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 3) Taco 테이블 생성
CREATE TABLE IF NOT EXISTS Taco (
                                    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                                    name VARCHAR(50) NOT NULL,
    taco_order BIGINT NOT NULL,
    taco_order_key BIGINT NOT NULL,
    created_at TIMESTAMP NOT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 4) Ingredient 테이블 생성
CREATE TABLE IF NOT EXISTS Ingredient (
                                          id VARCHAR(4) PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    type VARCHAR(10) NOT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 5) Ingredient_Ref 테이블 생성
CREATE TABLE IF NOT EXISTS Ingredient_Ref (
                                              ingredient VARCHAR(4) NOT NULL,
    taco BIGINT NOT NULL,
    taco_key BIGINT NOT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 6) 외래 키 설정
ALTER TABLE Taco
    ADD FOREIGN KEY (taco_order) REFERENCES Taco_Order(id);

ALTER TABLE Ingredient_Ref
    ADD FOREIGN KEY (ingredient) REFERENCES Ingredient(id),
    ADD FOREIGN KEY (taco) REFERENCES Taco(id);