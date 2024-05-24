-- Create GlobalShema
CREATE DATABASE Global;
USE Global;

-- create inventory table
CREATE TABLE inventory (
  inventory_id INT PRIMARY KEY NOT NULL,
  Capacity INT NOT NULL
);

-- insert  data into inventory Table
INSERT INTO inventory (inventory_id, Capacity)
VALUES 
  (0, 300);

CREATE TABLE location(
  location_id INT PRIMARY KEY NOT NULL,
  Address VARCHAR(200) NOT NULL,
  inventory_id INT NOT NULL,
  FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id)
);
-- insert  data into Location_site1 Table
INSERT INTO location(location_id, Address , inventory_id)
VALUES 
    (0, '77 main street',0)
    ; 

CREATE TABLE Supplier(
  supplier_id INT PRIMARY KEY NOT NULL,
  supplier_name VARCHAR(200) NOT NULL,
  phone INT NOT NULL
);
-- Insert data into the 'Supplier' table
INSERT INTO Supplier (supplier_id, supplier_name, phone) VALUES
(1, 'ABC Electronics', '1234567890'),
(2, 'XYZ Gadgets', '98765430'),
(3, 'Tech Innovations', '5234567'),
(4, 'Gizmo World', '9998777'),
(5, 'Widgets R Us', '11333'),
(6, 'Gadget Galaxy', '446666'),
(7, 'Innovative Solutions', '8889999'),
(8, 'ElectroTech', '666778'),
(9, 'Smart Devices Inc.', '222344'),
(10, 'Tech Trends', '88000'),
(11, 'Digital Dynamics', '344555'),
(12, 'Future Gizmos', '5554333'),
(13, 'NexGen Electronics', '1154444'),
(14, 'Tech Zone', '6661112'),
(15, 'Electronic Express', '2261111');

  CREATE TABLE customer (
 customer_id INT PRIMARY KEY NOT NULL,
  customer_Name VARCHAR(40) NOT NULL,
  Phone VARCHAR(40) NOT NULL,
  Email VARCHAR(40) NOT NULL,
 city VARCHAR(40) NOT NULL
);

INSERT INTO customer (customer_id, customer_Name, Phone, Email, city) VALUES
(1, 'John Doe', '123-456-7890', 'john.doe@email.com', 'New York'),
(2, 'Jane Smith', '987-654-3210', 'jane.smith@email.com', 'Los Angeles'),
(3, 'Bob Johnson', '555-123-4567', 'bob.johnson@email.com', 'Chicago'),
(4, 'Alice Brown', '999-888-7777', 'alice.brown@email.com', 'Houston'),
(5, 'David Wilson', '111-222-3333', 'david.wilson@email.com', 'Phoenix'),
(6, 'Emily Davis', '444-555-6666', 'emily.davis@email.com', 'Philadelphia'),
(7, 'Chris Miller', '777-888-9999', 'chris.miller@email.com', 'San Antonio'),
(8, 'Amy Taylor', '666-777-8888', 'amy.taylor@email.com', 'San Diego'),
(9, 'Mike White', '222-333-4444', 'mike.white@email.com', 'Dallas'),
(10, 'Sara Green', '888-999-0000', 'sara.green@email.com', 'San Jose'),
(11, 'Tom Harris', '333-444-5555', 'tom.harris@email.com', 'Austin'),
(12, 'Linda Carter', '555-444-3333', 'linda.carter@email.com', 'Jacksonville'),
(13, 'Mark Turner', '111-555-4444', 'mark.turner@email.com', 'Indianapolis'),
(14, 'Laura Hall', '666-111-2222', 'laura.hall@email.com', 'San Francisco'),
(15, 'Peter Clark', '222-666-1111', 'peter.clark@email.com', 'Columbus');

CREATE TABLE Transactions (
  tran_id INT PRIMARY KEY NOT NULL,
  TypeT VARCHAR(200) NOT NULL,
  inventory_id INT NOT NULL,
  supplier_id INT NOT NULL,
  customer_id INT NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
  FOREIGN KEY (inventory_id) REFERENCES inventory(inventory_id),
  FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);
-- Insert data into the 'Transaction' table
INSERT INTO Transactions (tran_id, TypeT, inventory_id, supplier_id,customer_id) VALUES
(1, 'Purchase', 0, 1,1),
(2, 'Purchase', 0, 2,2),
(3, 'Sale', 0, 3,3),
(4, 'Sale', 0, 4,4),
(5, 'Purchase', 0, 5,5),
(6, 'Sale', 0, 6,6),
(7, 'Purchase', 0, 7,7),
(8, 'Sale', 0, 8,8),
(9, 'Purchase', 0, 9,9),
(10, 'Sale', 0, 10,10),
(11, 'Purchase',0, 11,11),
(12, 'Sale', 0, 12,12),
(13, 'Purchase', 0, 13,13),
(14, 'Sale', 0, 14,14),
(15, 'Purchase', 0, 15,15);

CREATE TABLE Products (
  Pro_id INT PRIMARY KEY NOT NULL,
  BarCode VARCHAR(100) NOT NULL,
  PName VARCHAR(100) NOT NULL,
  Quantity INT NOT NULL,
  customer_id INT NOT NULL,
  FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

-- Insert data into the 'Products' table
INSERT INTO Products (Pro_id,customer_id,BarCode, PName, Quantity) VALUES
(1,1, '123456789', 'Laptop', 50),
(2,2, '987654321', 'Smartphone', 100),
(3,3, '111222333', 'Tablet', 75),
(4,4, '444555666', 'Smartwatch', 30),
(5, 5,'777888999', 'Headphones', 80),
(6,6, '666777888', 'Camera', 25),
(7,7, '222333444', 'Printer', 20),
(8,8, '888999000', 'Router', 35),
(9,9,'333444555', 'External Hard Drive', 40),
(10,10, '555444333', 'Mouse', 60),
(11,11, '111555444', 'Keyboard', 55),
(12,12, '555666777', 'Monitor', 45),
(13,13, '111222333', 'Speaker', 70),
(14,14, '666111222', 'Microphone', 15),
(15,15, '222666111', 'Graphics Card', 10);


CREATE TABLE Provide (
  Pro_id INT NOT NULL,
  supplier_id INT NOT NULL,
  PRIMARY KEY (Pro_id, supplier_id),
  FOREIGN KEY (Pro_id) REFERENCES Products(Pro_id),
  FOREIGN KEY (supplier_id) REFERENCES Supplier(supplier_id)
);
-- Insert data into the 'Provide' table
INSERT INTO Provide (Pro_id, supplier_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15);


CREATE TABLE store (
  inventory_id INT NOT NULL,
  Pro_id INT NOT NULL,
  Quantity INT NOT NULL,
  PRIMARY KEY (inventory_id, Pro_id ,Quantity),
  FOREIGN KEY (inventory_id )REFERENCES  inventory(inventory_id),
  FOREIGN KEY (Pro_id) REFERENCES Products(Pro_id)
);

-- Insert data into the 'store' table
INSERT INTO store (inventory_id, Pro_id, Quantity) VALUES
(0, 1, 10),
(0, 2, 20),
(0, 3, 15),
(0, 4, 5),
(0, 5, 25),
(0, 6, 8),
(0, 7, 7),
(0, 8, 12),
(0, 9, 18),
(0, 10, 22),
(0, 11, 16),
(0, 12, 14),
(0, 13, 30),
(0, 14, 3),
(0, 15, 2);


-- Create the First Location
CREATE DATABASE site1;
-- Use the First Location database
USE site1;

-- Create table for Inventory of site1
CREATE TABLE inventory_site1 (
  inventory_id1 INT  PRIMARY KEY NOT NULL,
  Capacity INT NOT NULL
);

-- insert  data into inventory_site1 Table
INSERT INTO inventory_site1 (inventory_id1, Capacity)
VALUES 
  (1, 300);
  
-- Create table for Location_sit1
CREATE TABLE location_site1 (
  location_id1 INT  PRIMARY KEY NOT NULL,
  Address VARCHAR(200) NOT NULL,
  inventory_id1 INT NOT NULL,
  FOREIGN KEY (inventory_id1) REFERENCES inventory_site1(inventory_id1)
);  

-- insert  data into Location_site1 Table
INSERT INTO location_site1 (location_id1, Address , inventory_id1)
VALUES 
    (1, '32 street',1)
    ; 

 -- Create table for Supplier_site1
CREATE TABLE Supplier_site1(
  supplier_id1 INT  PRIMARY KEY NOT NULL,
  supplier_name VARCHAR(100) NOT NULL,
  phone INT NOT NULL
  
);  
  

-- insert data into Supplier_site1 Table
INSERT INTO Supplier_site1 (supplier_id1, supplier_name, phone)
VALUES 
    (1, 'ALII', '0444984'),        
    (2, 'MUHAMMED','945312'),         
    (3, 'AHMED','85315'),
    (4, 'ZIEN','900932'),
    (5,'ZIED ','900885')
    ; 


-- Create table for customer_site1

CREATE TABLE customer_site1(
        customer_id1 INT  PRIMARY KEY NOT NULL,
        customer_Name VARCHAR(40) NOT NULL,
        Phone VARCHAR(40) NOT NULL,
        Email VARCHAR(40) NOT NULL,
        city VARCHAR(40) NOT NULL
        
    );

-- insert  data into customer_site1 Table
INSERT INTO customer_site1 (customer_id1, customer_Name, Phone, Email, city)
VALUES 
(1, 'John Doe', '1234567890', 'johndoe@example.com', 'New York'),
(2, 'Jane Smith', '9876543210', 'janesmith@example.com', 'Los Angeles'),
(3, 'Mike Johnson', '5555555555', 'mikejohnson@example.com', 'Chicago'),
(4, 'Emily Davis', '1111111111', 'emilydavis@example.com', 'Houston'),
(5, 'David Wilson', '9999999999', 'davidwilson@example.com', 'Miami');

CREATE TABLE Transaction_site1(
  tran_id1 INT  PRIMARY KEY NOT NULL,
  TypeT VARCHAR(200) NOT NULL,
  inventory_id1 INT NOT NULL,
  supplier_id1 INT NOT NULL,
  customer_id1 INT NOT NULL,
  FOREIGN KEY (customer_id1) REFERENCES customer_site1(customer_id1),
  FOREIGN KEY (inventory_id1) REFERENCES inventory_site1(inventory_id1),
  FOREIGN KEY (supplier_id1) REFERENCES Supplier_site1(supplier_id1)
); 

-- insert data into Transaction_site1 Table
INSERT INTO Transaction_site1 (tran_id1,customer_id1, TypeT,inventory_id1,supplier_id1)
VALUES 
    (1,1, 'Cash',1,2),        
    (2,2, 'Credit Card',1,1),         
    (3,3, 'Annual insatllment',1,3),
    (4, 4,'Cash',1,4),
    (5,5,'Credit Card',1,5)
    ; 
    
-- Create table for Products_site1
CREATE TABLE Products_site1 (
  Pro_id1 INT  PRIMARY KEY NOT NULL,
  BarCode VARCHAR(100) NOT NULL,
  PName VARCHAR(100) NOT NULL,
  Quantity INT NOT NULL,
  customer_id1 INT NOT NULL,
  FOREIGN KEY (customer_id1) REFERENCES customer_site1(customer_id1)
);  

-- insert  data into Products_site1 Table
INSERT INTO Products_site1 (Pro_id1,customer_id1, BarCode, PName, Quantity)
VALUES
  (1,1, '123456789', 'Product A', 10),
  (2, 2,'987654321', 'Product B', 20),
  (3,3, '456789123', 'Product C', 15),
  (4,4, '789123456', 'Product D', 25),
  (5, 5,'321654987', 'Product E', 30);


-- Create table for Provide_site1 relation between supplier table and prodicut
 CREATE TABLE Provide_site1 (
  Pro_id1 INT NOT NULL,
  supplier_id1 INT NOT NULL,
  PRIMARY KEY ( Pro_id1, supplier_id1),
  FOREIGN KEY ( Pro_id1) REFERENCES Products_site1( Pro_id1),
  FOREIGN KEY (supplier_id1 ) REFERENCES Supplier_site1(supplier_id1)
);  

INSERT INTO Provide_site1(Pro_id1, supplier_id1) 
VALUES
   (1,1),
   (2,2),
   (3,3);


-- Create table for store_site1 relation inventory and produict
CREATE TABLE store_site1 (
 inventory_id1 INT NOT NULL,
  Pro_id1 INT NOT NULL,
  Quantity INT NOT NULL,
  PRIMARY KEY ( inventory_id1, Pro_id1, Quantity),
   FOREIGN KEY (inventory_id1) REFERENCES inventory_site1(inventory_id1),
   FOREIGN KEY (Pro_id1) REFERENCES Products_site1(Pro_id1)
);


-- insert  data into store_site1 
INSERT INTO store_site1 (inventory_id1, Pro_id1, Quantity)
VALUES 
    (1, 1, 20),        
    (1, 2, 10),         
    (1, 3,15)
    ;

-- Create the Second Location
CREATE DATABASE site2;
-- Use the Second Location database

USE site2;
 
-- Create table for Inventory of site2
CREATE TABLE inventory_site2 (
  inventory_id2 INT  PRIMARY KEY NOT NULL,
  Capacity INT NOT NULL
);

-- insert  data into inventory_site2 Table
INSERT INTO inventory_site2 (inventory_id2, Capacity)
VALUES 
  (2, 300);
  
-- Create table for Location_sit2
CREATE TABLE location_site2 (
  location_id2 INT  PRIMARY KEY NOT NULL,
  Address VARCHAR(200) NOT NULL,
  inventory_id2 INT NOT NULL,
  FOREIGN KEY (inventory_id2) REFERENCES inventory_site2(inventory_id2)
);  

-- insert  data into Location_site2 Table
INSERT INTO location_site2 (location_id2, Address , inventory_id2)
VALUES 
    (2, '555 main street',2)
    ; 

 -- Create table for Supplier_site2
CREATE TABLE Supplier_site2(
  supplier_id2 INT  PRIMARY KEY NOT NULL,
  supplier_name VARCHAR(100) NOT NULL,
  phone INT NOT NULL
  
);  
  

-- insert data into Supplier_site2 Table
INSERT INTO Supplier_site2 (supplier_id2, supplier_name, phone)
VALUES 
    (1, 'ALII', '0444984'),        
    (2, 'MUHAMMED','945312'),         
    (3, 'AHMED','85315'),
    (4, 'ZIEN','900932'),
    (5,'ZIED ','900885')
    ; 


-- Create table for customer_site2
CREATE TABLE customer_site2(
        customer_id2 INT  PRIMARY KEY NOT NULL,
        customer_Name VARCHAR(40) NOT NULL,
        Phone VARCHAR(40) NOT NULL,
        Email VARCHAR(40) NOT NULL,
        city VARCHAR(40) NOT NULL
        
    );

-- insert  data into customer_site2 Table
INSERT INTO customer_site2 (customer_id2, customer_Name, Phone, Email, city)
VALUES 
(1, 'John Doe', '1234567890', 'johndoe@example.com', 'New York'),
(2, 'Jane Smith', '9876543210', 'janesmith@example.com', 'Los Angeles'),
(3, 'Mike Johnson', '5555555555', 'mikejohnson@example.com', 'Chicago'),
(4, 'Emily Davis', '1111111111', 'emilydavis@example.com', 'Houston'),
(5, 'David Wilson', '9999999999', 'davidwilson@example.com', 'Miami');

CREATE TABLE Transaction_site2(
  tran_id2 INT  PRIMARY KEY NOT NULL,
  TypeT VARCHAR(200) NOT NULL,
  inventory_id2 INT NOT NULL,
  supplier_id2 INT NOT NULL,
  customer_id2 INT NOT NULL,
  FOREIGN KEY (customer_id2) REFERENCES customer_site2(customer_id2),
  FOREIGN KEY (inventory_id2) REFERENCES inventory_site2(inventory_id2),
  FOREIGN KEY (supplier_id2) REFERENCES Supplier_site2(supplier_id2)
); 

-- insert data into Transaction_site2 Table
INSERT INTO Transaction_site2 (tran_id2, TypeT,inventory_id2,supplier_id2,customer_id2)
VALUES 
    (1, 'Cash',2,1,1),        
    (2, 'Credit Card',2,2,2),         
    (3, 'Annual insatllment',2,3,3),
    (4, 'Cash',2,4,4),
    (5,'Credit Card',2,5,5)
    ;     

-- Create table for Products_site2
CREATE TABLE Products_site2 (
  Pro_id2 INT  PRIMARY KEY NOT NULL,
  BarCode VARCHAR(100) NOT NULL,
  PName VARCHAR(100) NOT NULL,
  Quantity INT NOT NULL,
  customer_id2 INT NOT NULL,
  FOREIGN KEY (customer_id2) REFERENCES customer_site2(customer_id2),
);  

-- insert  data into Products_site2 Table
INSERT INTO Products_site2 (Pro_id2,customer_id2, BarCode, PName, Quantity)
VALUES
  (1,1, '123456789', 'Product A', 1000),
  (2,2, '987654321', 'Product B', 540),
  (3,3, '456789123', 'Product C', 700),
  (4,4, '789123456', 'Product D', 25),
  (5,5, '321654987', 'Product E', 30);


-- Create table for Provide_site2 relation between supplier table and prodicut
 CREATE TABLE Provide_site2 (
  Pro_id2 INT NOT NULL,
  supplier_id2 INT NOT NULL,
  PRIMARY KEY ( Pro_id2, supplier_id2),
  FOREIGN KEY ( Pro_id2) REFERENCES Products_site2( Pro_id2),
  FOREIGN KEY (supplier_id2) REFERENCES Supplier_site2(supplier_id2)
);  
INSERT INTO Provide_site2(Pro_id2, supplier_id2) 
VALUES
   (1,1),
   (2,2),
   (3,3);


-- Create table for store_site2 relation inventory and produict
CREATE TABLE store_site2 (
 inventory_id2 INT NOT NULL,
  Pro_id2 INT NOT NULL,
  Quantity INT NOT NULL,
  PRIMARY KEY ( inventory_id2, Pro_id2, Quantity),
   FOREIGN KEY (inventory_id2) REFERENCES inventory_site2(inventory_id2),
   FOREIGN KEY (Pro_id2) REFERENCES Products_site2(Pro_id2)
);


-- insert  data into store_site2 Table
INSERT INTO store_site2 (inventory_id2, Pro_id2, Quantity)
VALUES 
    (2,1, 160),        
    (2,2, 250),         
    (2, 3,290)
    ;
 
    -- Create the Third Location

CREATE DATABASE site3;
USE site3;

-- Create table for Inventory of site3
CREATE TABLE inventory_site3 (
  inventory_id3 INT  PRIMARY KEY NOT NULL,
  Capacity INT NOT NULL
);

-- insert  data into inventory_site3 Table
INSERT INTO inventory_site3 (inventory_id3, Capacity)
VALUES 
  (3, 370);
  
-- Create table for Location_sit3
CREATE TABLE location_site3 (
  location_id3 INT  PRIMARY KEY NOT NULL,
  Address VARCHAR(200) NOT NULL,
  inventory_id3 INT NOT NULL,
  FOREIGN KEY (inventory_id3) REFERENCES inventory_site3(inventory_id3)
);  

-- insert  data into Location_site1 Table
INSERT INTO location_site3 (location_id3, Address , inventory_id3)
VALUES 
    (3, 'alex 34 main s',3)
    ; 

 -- Create table for Supplier_site3
CREATE TABLE Supplier_site3(
  supplier_id3 INT  PRIMARY KEY NOT NULL,
  supplier_name VARCHAR(100) NOT NULL,
  phone INT NOT NULL
  
);  
  

-- insert data into Supplier_site3 Table
INSERT INTO Supplier_site3 (supplier_id3, supplier_name, phone)
VALUES 
    (1, 'ALII', '0444984'),        
    (2, 'MUHAMMED zien','945312'),         
    (3, 'Adham ','85315'),
    (4, 'ZIEN eprahim','900932'),
    (5,'ZIED ali ','900885')
    ; 


-- Create table for customer_site3

CREATE TABLE customer_site3(
        customer_id3 INT  PRIMARY KEY NOT NULL,
        customer_Name VARCHAR(40) NOT NULL,
        Phone VARCHAR(40) NOT NULL,
        Email VARCHAR(40) NOT NULL,
        city VARCHAR(40) NOT NULL
        
    );

-- insert  data into customer_site3 Table
INSERT INTO customer_site3 (customer_id3, customer_Name, Phone, Email, city)
VALUES 
(1, 'John Doe', '1234567890', 'johndoe@example.com', 'New York'),
(2, 'Jane Smith', '9876543210', 'janesmith@example.com', 'Los Angeles'),
(3, 'Mike Johnson', '5555555555', 'mikejohnson@example.com', 'Chicago'),
(4, 'Emily Davis', '1111111111', 'emilydavis@example.com', 'Houston'),
(5, 'David Wilson', '9999999999', 'davidwilson@example.com', 'Miami');

CREATE TABLE Transaction_site3(
  tran_id3 INT  PRIMARY KEY NOT NULL,
  TypeT VARCHAR(200) NOT NULL,
  inventory_id3 INT NOT NULL,
  supplier_id3 INT NOT NULL,
  customer_id3 INT NOT NULL,
  FOREIGN KEY (customer_id3) REFERENCES customer_site3(customer_id3),
  FOREIGN KEY (inventory_id3) REFERENCES inventory_site3(inventory_id3),
  FOREIGN KEY (supplier_id3) REFERENCES Supplier_site3(supplier_id3) 
  );

	INSERT INTO Transaction_site3 (tran_id3, TypeT,inventory_id3,supplier_id3,customer_id3)
VALUES 
    (1, 'Cash',3,1,1),        
    (2, 'Credit Card',3,2,2),         
    (3, 'Annual insatllment',3,3,3),
    (4, 'Cash',3,4,4),
    (5,'Credit Card',3,5,5)
    ; 
    



-- Create table for Products_site3
CREATE TABLE Products_site3 (
  Pro_id3 INT  PRIMARY KEY NOT NULL,
  BarCode VARCHAR(100) NOT NULL,
  PName VARCHAR(100) NOT NULL,
  Quantity INT NOT NULL,
  customer_id3 INT NOT NULL,
  FOREIGN KEY (customer_id3) REFERENCES customer_site3(customer_id3),
);  

-- insert  data into Products_site3 Table
  INSERT INTO Products_site3 (Pro_id3, customer_id3,PName, BarCode,Quantity)
VALUES 
  (1,1, '12345aaa', '0008', 1000),
  (2,2, '9876sss', '0006', 540),
  (3,3, '456ffff', '00004', 700),
  (4,4, '78912rrr', '0004', 25),
  (5,5, '32165yyy', '00003', 30);
 
 

-- Create table for Provide_site3 
 CREATE TABLE Provide_site3 (
  Pro_id3 INT NOT NULL,
  supplier_id3 INT NOT NULL,
  PRIMARY KEY ( Pro_id3, supplier_id3),
  FOREIGN KEY ( Pro_id3) REFERENCES Products_site3( Pro_id3),
  FOREIGN KEY (supplier_id3 ) REFERENCES Supplier_site3(supplier_id3)
);  

INSERT INTO Provide_site3(Pro_id3, supplier_id3) 
VALUES
   (1,1),
   (2,2),
   (3,3);

-- Create table for store_site3 
CREATE TABLE store_site3 (
 inventory_id3 INT NOT NULL,
  Pro_id3 INT NOT NULL,
  Quantity INT NOT NULL,
  PRIMARY KEY ( inventory_id3, Pro_id3, Quantity),
   FOREIGN KEY (inventory_id3) REFERENCES inventory_site3(inventory_id3),
   FOREIGN KEY (Pro_id3) REFERENCES Products_site3(Pro_id3)
);

 INSERT INTO store_site3 (inventory_id3,Pro_id3 ,Quantity)
VALUES
    (3, 1, 130),        
    (3, 2, 250),         
    (3, 3,190)
    ;



   
-- Create Linked Server from site1 to site2
USE site1;
EXEC sp_addlinkedserver 'site2', N'SQL Server';
EXEC sp_addlinkedsrvlogin 'site2', 'false', NULL, 'ABCD', '123456';

SELECT * FROM site2.dbo.Products_site2;

-- Create Linked Server from Site 1 to Site 3
USE site1;
EXEC sp_addlinkedserver 'site3', N'SQL Server';
EXEC sp_addlinkedsrvlogin 'site3', 'false', NULL, 'ABCD', '123456';

SELECT * FROM site3.dbo.Products_site3;


-- Create Linked Server from Site2 to Site 3

USE site2;
EXEC sp_addlinkedserver 'site3', N'SQL Server';
EXEC sp_addlinkedsrvlogin 'site3', 'false', NULL, 'ABCD', '123456';

SELECT * FROM site3.dbo.Products_site3;

--create linked server with glopal
USE site1;
EXEC sp_addlinkedserver 'Global', N'SQL Server';
EXEC sp_addlinkedsrvlogin 'Global', 'false', NULL, 'ABCD', '123456';



--update QuantityGlobal
USE Global;
CREATE TRIGGER trg_UpdateQuantity_Global0
ON dbo.Products
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE site1.dbo.Products_site1
    SET Quantity = i.Quantity
    FROM inserted i
    WHERE site1.dbo.Products_site1.Pro_id1 = i.Pro_id; 
END;

CREATE TRIGGER trg_UpdateQuantityGlobal2
ON dbo.Products
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE site2.dbo.Products_site2
    SET Quantity = i.Quantity
    FROM inserted i
    WHERE site2.dbo.Products_site2.Pro_id2 = i.Pro_id; 
END;

CREATE TRIGGER trg_UpdateQuantityGlobal3
ON dbo.Products
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE site3.dbo.Products_site3
    SET Quantity = i.Quantity
    FROM inserted i
    WHERE site3.dbo.Products_site3.Pro_id3 = i.Pro_id; 
END;


-- create triggers for updating database
USE site1;
GO 
 --update products_site2 from site1
CREATE TRIGGER trg_UpdateQuantitysite1
ON dbo.Products_site1
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE site2.dbo.Products_site2
    SET Quantity = i.Quantity
    FROM inserted i
    WHERE site2.dbo.Products_site2.Pro_id2 = i.Pro_id1;
END;
GO


-- update products_site3 from site1
CREATE TRIGGER trg_UpdateQuantitysite2
ON dbo.Products_site1
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE site3.dbo.Products_site3
    SET Quantity = i.Quantity
    FROM inserted i
    WHERE site3.dbo.Products_site3.Pro_id3 = i.Pro_id1; 
END;




SELECT * FROM Products_site1

UPDATE Products SET Quantity = 1234 WHERE Pro_id = 1;
UPDATE Products_site1 SET Quantity = 540 WHERE Pro_id1 = 1;
SELECT * FROM Products
SELECT * FROM Products_site1
select * from site2.dbo.Products_site2
select * from site3.dbo.Products_site3
 
-- try another update
use Global;

UPDATE Products SET Quantity = 1234 WHERE Pro_id = 1;

SELECT * FROM Products
select * from site2.dbo.Products_site2
select * from site3.dbo.Products_site3
 




--start transaction for site 1
use site1;
BEGIN TRY 
BEGIN TRANSACTION;

    UPDATE Products_site1 SET Quantity = Quantity - 1 WHERE Pro_id1 = 1;
    UPDATE store_sit1  SET Quantity = Quantity - 1 WHERE inventory_id1 = 1 AND Pro_id1 = 1;

    COMMIT;
END TRY
BEGIN CATCH
    -- Handle errors if any
    ROLLBACK;
END CATCH;


 --start transaction for site2
 use site2;
   BEGIN TRY 
BEGIN TRANSACTION;

    UPDATE Products_site2 SET Quantity = Quantity - 1 WHERE Pro_id2 = 1;
    UPDATE store_site2 SET Quantity = Quantity - 1 WHERE inventory_id2 = 1 AND Pro_id2 = 1;

    COMMIT;
END TRY
BEGIN CATCH
    -- Handle errors if any
    ROLLBACK;
END CATCH;

  --start transaction for site3
 use site3;
   BEGIN TRY 
BEGIN TRANSACTION;

    UPDATE Products_site3 SET Quantity = Quantity - 1 WHERE Pro_id3 = 1;
    UPDATE store_site3 SET Quantity = Quantity - 1 WHERE inventory_id3 = 1 AND Pro_id3 = 1;

    COMMIT;
END TRY
BEGIN CATCH
    -- Handle errors if any
    ROLLBACK;
END CATCH;

-- Start transaction for site 1
USE site1;
DECLARE @quantityToTake1 INT = [Products_Site1.Quantity]; -- Replace [CUSTOMER_QUANTITY_1] with the actual quantity the customer will take

BEGIN TRY 
    BEGIN TRANSACTION;

    UPDATE Products_site1 SET Quantity = Quantity - @quantityToTake1 WHERE Pro_id1 = 1;
    UPDATE store_sit1 SET Quantity = Quantity - @quantityToTake1 WHERE inventory_id1 = 1 AND Pro_id1 = 1;

    COMMIT;
END TRY
BEGIN CATCH
    -- Handle errors if any
    ROLLBACK;
END CATCH;

-- Start transaction for site 2
USE site2;
DECLARE @quantityToTake2 INT = [CUSTOMER_QUANTITY_2]; -- Replace [CUSTOMER_QUANTITY_2] with the actual quantity the customer will take

BEGIN TRY 
    BEGIN TRANSACTION;

    UPDATE Products_site2 SET Quantity = Quantity - @quantityToTake2 WHERE Pro_id2 = 1;
    UPDATE store_site2 SET Quantity = Quantity - @quantityToTake2 WHERE inventory_id2 = 1 AND Pro_id2 = 1;

    COMMIT;
END TRY
BEGIN CATCH
    -- Handle errors if any
    ROLLBACK;
END CATCH;

-- Start transaction for site 3
USE site3;
DECLARE @quantityToTake3 INT = [CUSTOMER_QUANTITY_3]; -- Replace [CUSTOMER_QUANTITY_3] with the actual quantity the customer will take

BEGIN TRY 
    BEGIN TRANSACTION;

    UPDATE Products_site3 SET Quantity = Quantity - @quantityToTake3 WHERE Pro_id3 = 1;
    UPDATE store_site3 SET Quantity = Quantity - @quantityToTake3 WHERE inventory_id3 = 1 AND Pro_id3 = 1;

    COMMIT;
END TRY
BEGIN CATCH
    -- Handle errors if any
    ROLLBACK;
END CATCH;