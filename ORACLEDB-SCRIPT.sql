-- Drop each specified object and catch exceptions that occur if the object does not exist.
-- The WHEN OTHERS THEN exception handler checks for the Oracle error code -942 (for non-existent tables)
-- or -2289 (for non-existent sequences), silently catching these errors while re-raising others.

-- Dropping Tables with Existence Checks
BEGIN
EXECUTE IMMEDIATE 'DROP TABLE OrderDetail CASCADE CONSTRAINTS';
EXCEPTION
WHEN OTHERS THEN
IF SQLCODE != -942 THEN
RAISE;
END IF;
END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE ShipmentDetail CASCADE CONSTRAINTS';
EXCEPTION
WHEN OTHERS THEN
IF SQLCODE != -942 THEN
RAISE;
END IF;
END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE WarehouseStorage CASCADE CONSTRAINTS';
EXCEPTION
WHEN OTHERS THEN
IF SQLCODE != -942 THEN
RAISE;
END IF;
END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE SupplyContract CASCADE CONSTRAINTS';
EXCEPTION
WHEN OTHERS THEN
IF SQLCODE != -942 THEN
RAISE;
END IF;
END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE Orders CASCADE CONSTRAINTS';
EXCEPTION
WHEN OTHERS THEN
IF SQLCODE != -942 THEN
RAISE;
END IF;
END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE Shipments CASCADE CONSTRAINTS';
EXCEPTION
WHEN OTHERS THEN
IF SQLCODE != -942 THEN
RAISE;
END IF;
END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE Suppliers CASCADE CONSTRAINTS';
EXCEPTION
WHEN OTHERS THEN
IF SQLCODE != -942 THEN
RAISE;
END IF;
END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE Warehouses CASCADE CONSTRAINTS';
EXCEPTION
WHEN OTHERS THEN
IF SQLCODE != -942 THEN
RAISE;
END IF;
END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP TABLE Products CASCADE CONSTRAINTS';
EXCEPTION
WHEN OTHERS THEN
IF SQLCODE != -942 THEN
RAISE;
END IF;
END;
/

-- Dropping Sequences with Existence Checks

BEGIN
EXECUTE IMMEDIATE 'DROP SEQUENCE product_seq';
EXCEPTION
WHEN OTHERS THEN
IF SQLCODE != -2289 THEN
RAISE;
END IF;
END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP SEQUENCE warehouse_seq';
EXCEPTION
WHEN OTHERS THEN
IF SQLCODE != -2289 THEN
RAISE;
END IF;
END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP SEQUENCE supplier_seq';
EXCEPTION
WHEN OTHERS THEN
IF SQLCODE != -2289 THEN
RAISE;
END IF;
END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP SEQUENCE shipment_seq';
EXCEPTION
WHEN OTHERS THEN
IF SQLCODE != -2289 THEN
RAISE;
END IF;
END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP SEQUENCE order_seq';
EXCEPTION
WHEN OTHERS THEN
IF SQLCODE != -2289 THEN
RAISE;
END IF;
END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP SEQUENCE supplycontract_seq';
EXCEPTION
WHEN OTHERS THEN
IF SQLCODE != -2289 THEN
RAISE;
END IF;
END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP SEQUENCE warehousestorage_seq';
EXCEPTION
WHEN OTHERS THEN
IF SQLCODE != -2289 THEN
RAISE;
END IF;
END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP SEQUENCE shipmentdetail_seq';
EXCEPTION
WHEN OTHERS THEN
IF SQLCODE != -2289 THEN
RAISE;
END IF;
END;
/

BEGIN
EXECUTE IMMEDIATE 'DROP SEQUENCE orderdetail_seq';
EXCEPTION
WHEN OTHERS THEN
IF SQLCODE != -2289 THEN
RAISE;
END IF;
END;
/

-- Creating Sequences for Auto-incremented IDs

CREATE SEQUENCE product_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE warehouse_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE supplier_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE shipment_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE order_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

-- Sequences for associative classes
CREATE SEQUENCE supplycontract_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE warehousestorage_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE shipmentdetail_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

CREATE SEQUENCE orderdetail_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;

-- Creating Entity Tables

CREATE TABLE Products (
	ProductID INT PRIMARY KEY,
	Name VARCHAR2(255) NOT NULL,
	Description VARCHAR2(255),
	SKU VARCHAR2(100) NOT NULL UNIQUE,
	Category VARCHAR2(100),
	UnitPrice DECIMAL(10, 2) NOT NULL,
	QuantityOnHand INT NOT NULL,
	ReorderPoint INT NOT NULL
);

CREATE TABLE Warehouses (
	WarehouseID INT PRIMARY KEY,
	Name VARCHAR2(255) NOT NULL,
	Location VARCHAR2(255),
	Capacity INT NOT NULL
);

BEGIN
EXECUTE IMMEDIATE 'CREATE TYPE ContactInfo AS OBJECT (
email VARCHAR2(255),
phone VARCHAR2(20),
address VARCHAR2(255)
)';
EXCEPTION
WHEN OTHERS THEN
IF SQLCODE = -955 THEN
      NULL; -- Type ContactInfo already exists, so it was not created again
      ELSE
      RAISE; -- Re-raise the exception if it's not the "type already exists" error
      END IF;
      END;
      /


      CREATE TABLE Suppliers (
      	SupplierID INT PRIMARY KEY,
      	Name VARCHAR2(255) NOT NULL,
      	ContactDetails ContactInfo
      	);


      CREATE TABLE Shipments (
      	ShipmentID INT PRIMARY KEY,
      	ShipmentDate DATE NOT NULL,
      	Origin VARCHAR2(255) NOT NULL,
      	Destination VARCHAR2(255) NOT NULL,
      	Status VARCHAR2(100) NOT NULL
      	);

      CREATE TABLE Orders (
      	OrderID INT PRIMARY KEY,
      	OrderDate DATE NOT NULL,
      	CustomerInformation VARCHAR2(255),
      	OrderStatus VARCHAR2(100) NOT NULL
      	);

-- Creating Associative Tables (Many-to-Many Relationships)

CREATE TABLE SupplyContract (
	ContractID INT PRIMARY KEY,
	SupplierID INT NOT NULL,
	ProductID INT NOT NULL,
	SupplyPrice DECIMAL(10, 2) NOT NULL,
	MinimumOrderQuantity INT NOT NULL,
	DeliverySchedule VARCHAR2(255) NOT NULL,
	ContractStartDate DATE NOT NULL,
	ContractEndDate DATE NOT NULL,
	FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE WarehouseStorage (
	StorageID INT PRIMARY KEY,
	WarehouseID INT NOT NULL,
	ProductID INT NOT NULL,
	Quantity INT NOT NULL,
	StorageConditions VARCHAR2(255),
	EntryDate DATE NOT NULL,
	FOREIGN KEY (WarehouseID) REFERENCES Warehouses(WarehouseID),
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE ShipmentDetail (
	ShipmentDetailID INT PRIMARY KEY,
	ShipmentID INT NOT NULL,
	ProductID INT NOT NULL,
	Quantity INT NOT NULL,
	Condition VARCHAR2(255),
	FOREIGN KEY (ShipmentID) REFERENCES Shipments(ShipmentID),
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE OrderDetail (
	OrderDetailID INT PRIMARY KEY,
	OrderID INT NOT NULL,
	ProductID INT NOT NULL,
	Quantity INT NOT NULL,
	Price DECIMAL(10, 2) NOT NULL,
	FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
	FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


-- Insert Sample Data for Products

INSERT INTO Products (ProductID, Name, Description, SKU, Category, UnitPrice, QuantityOnHand, ReorderPoint) VALUES (product_seq.NEXTVAL, 'PlayStation 5', 'Latest generation console from Sony.', 'SKU-PS5', 'Consoles', 499.99, 50, 5);
INSERT INTO Products (ProductID, Name, Description, SKU, Category, UnitPrice, QuantityOnHand, ReorderPoint) VALUES (product_seq.NEXTVAL, 'Xbox Series X', 'The fastest, most powerful Xbox ever.', 'SKU-XSX', 'Consoles', 499.99, 50, 5);
INSERT INTO Products (ProductID, Name, Description, SKU, Category, UnitPrice, QuantityOnHand, ReorderPoint) VALUES (product_seq.NEXTVAL, 'Nintendo Switch', 'Home gaming system that you can play on-the-go.', 'SKU-NSW', 'Consoles', 299.99, 100, 10);
INSERT INTO Products (ProductID, Name, Description, SKU, Category, UnitPrice, QuantityOnHand, ReorderPoint) VALUES (product_seq.NEXTVAL, 'DualSense Wireless Controller', 'Next-gen controller for PlayStation 5.', 'SKU-DSWC', 'Peripherals', 69.99, 200, 20);
INSERT INTO Products (ProductID, Name, Description, SKU, Category, UnitPrice, QuantityOnHand, ReorderPoint) VALUES (product_seq.NEXTVAL, 'Xbox Wireless Controller', 'Enhanced comfort wireless controller for Xbox.', 'SKU-XWC', 'Peripherals', 59.99, 200, 20);
INSERT INTO Products (ProductID, Name, Description, SKU, Category, UnitPrice, QuantityOnHand, ReorderPoint) VALUES (product_seq.NEXTVAL, 'Nintendo Switch Pro Controller', 'Premium controller for Nintendo Switch.', 'SKU-NSPC', 'Peripherals', 69.99, 150, 15);
INSERT INTO Products (ProductID, Name, Description, SKU, Category, UnitPrice, QuantityOnHand, ReorderPoint) VALUES (product_seq.NEXTVAL, 'The Legend of Zelda: Breath of the Wild', 'Open-air adventure game for Nintendo Switch.', 'SKU-ZELDA', 'Games', 59.99, 100, 10);
INSERT INTO Products (ProductID, Name, Description, SKU, Category, UnitPrice, QuantityOnHand, ReorderPoint) VALUES (product_seq.NEXTVAL, 'Elden Ring', 'Action RPG game for PlayStation 5 and Xbox Series X.', 'SKU-ELDR', 'Games', 59.99, 150, 15);
INSERT INTO Products (ProductID, Name, Description, SKU, Category, UnitPrice, QuantityOnHand, ReorderPoint) VALUES (product_seq.NEXTVAL, 'FIFA 24', 'Latest installment of the FIFA series for all consoles.', 'SKU-FIFA24', 'Games', 59.99, 200, 20);
INSERT INTO Products (ProductID, Name, Description, SKU, Category, UnitPrice, QuantityOnHand, ReorderPoint) VALUES (product_seq.NEXTVAL, 'Call of Duty: Vanguard', 'First-person shooter for PlayStation 5 and Xbox Series X.', 'SKU-CODVG', 'Games', 59.99, 150, 15);
INSERT INTO Products (ProductID, Name, Description, SKU, Category, UnitPrice, QuantityOnHand, ReorderPoint) VALUES (product_seq.NEXTVAL, 'Assassin’s Creed Valhalla', 'Action RPG for PlayStation 5 and Xbox Series X.', 'SKU-ACV', 'Games', 59.99, 100, 10);
INSERT INTO Products (ProductID, Name, Description, SKU, Category, UnitPrice, QuantityOnHand, ReorderPoint) VALUES (product_seq.NEXTVAL, 'Spider-Man: Miles Morales', 'Adventure game for PlayStation 5.', 'SKU-SMMM', 'Games', 49.99, 100, 10);
INSERT INTO Products (ProductID, Name, Description, SKU, Category, UnitPrice, QuantityOnHand, ReorderPoint) VALUES (product_seq.NEXTVAL, 'Halo Infinite', 'The next chapter of the Halo series for Xbox.', 'SKU-HI', 'Games', 59.99, 150, 15);
INSERT INTO Products (ProductID, Name, Description, SKU, Category, UnitPrice, QuantityOnHand, ReorderPoint) VALUES (product_seq.NEXTVAL, 'Ratchet & Clank: Rift Apart', 'Interdimensional adventure game for PlayStation 5.', 'SKU-RCA', 'Games', 69.99, 50, 5);
INSERT INTO Products (ProductID, Name, Description, SKU, Category, UnitPrice, QuantityOnHand, ReorderPoint) VALUES (product_seq.NEXTVAL, 'Animal Crossing: New Horizons', 'Life simulation game for Nintendo Switch.', 'SKU-ACNH', 'Games', 59.99, 100, 10);

-- Insert Sample Data for Suppliers

INSERT INTO Suppliers (SupplierID, Name, ContactDetails)
VALUES (supplier_seq.NEXTVAL, 'Game World Inc.', ContactInfo('contact@gameworld.com', '123-456-7890', '123 Game Lane, Gametown, GT'));

INSERT INTO Suppliers (SupplierID, Name, ContactDetails)
VALUES (supplier_seq.NEXTVAL, 'Tech Adventures', ContactInfo('info@techadventures.com', '234-567-8901', '456 Tech Park, Techville, TV'));

INSERT INTO Suppliers (SupplierID, Name, ContactDetails)
VALUES (supplier_seq.NEXTVAL, 'Console Kings', ContactInfo('sales@consolekings.com', '345-678-9012', '789 Console Ave, Kingstown, KT'));

INSERT INTO Suppliers (SupplierID, Name, ContactDetails)
VALUES (supplier_seq.NEXTVAL, 'Virtual Fun', ContactInfo('support@virtualfun.com', '456-789-0123', '101 Virtual Road, Fun City, FC'));

INSERT INTO Suppliers (SupplierID, Name, ContactDetails)
VALUES (supplier_seq.NEXTVAL, 'Epic Gaming Supplies', ContactInfo('help@epicgamingsupplies.com', '567-890-1234', '202 Game St, Epicburg, EP'));


-- Insert sample data for Supply Contracts for Each Product and Supplier (Associative Table). Details of the contract we have with a supplier for each of the products we deal with.

INSERT INTO SupplyContract (ContractID, SupplierID, ProductID, SupplyPrice, MinimumOrderQuantity, DeliverySchedule, ContractStartDate, ContractEndDate) VALUES (supplycontract_seq.NEXTVAL, 1, 1, 499.99, 5, 'Monthly', TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD'));
INSERT INTO SupplyContract (ContractID, SupplierID, ProductID, SupplyPrice, MinimumOrderQuantity, DeliverySchedule, ContractStartDate, ContractEndDate) VALUES (supplycontract_seq.NEXTVAL, 2, 2, 499.99, 5, 'Monthly', TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD'));
INSERT INTO SupplyContract (ContractID, SupplierID, ProductID, SupplyPrice, MinimumOrderQuantity, DeliverySchedule, ContractStartDate, ContractEndDate) VALUES (supplycontract_seq.NEXTVAL, 3, 3, 299.99, 10, 'Every 2 Months', TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_DATE('2024-11-15', 'YYYY-MM-DD'));
INSERT INTO SupplyContract (ContractID, SupplierID, ProductID, SupplyPrice, MinimumOrderQuantity, DeliverySchedule, ContractStartDate, ContractEndDate) VALUES (supplycontract_seq.NEXTVAL, 4, 4, 69.99, 20, 'Quarterly', TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD'));
INSERT INTO SupplyContract (ContractID, SupplierID, ProductID, SupplyPrice, MinimumOrderQuantity, DeliverySchedule, ContractStartDate, ContractEndDate) VALUES (supplycontract_seq.NEXTVAL, 5, 5, 59.99, 15, 'Monthly', TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD'));
INSERT INTO SupplyContract (ContractID, SupplierID, ProductID, SupplyPrice, MinimumOrderQuantity, DeliverySchedule, ContractStartDate, ContractEndDate) VALUES (supplycontract_seq.NEXTVAL, 1, 6, 69.99, 10, 'Monthly', TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD'));
INSERT INTO SupplyContract (ContractID, SupplierID, ProductID, SupplyPrice, MinimumOrderQuantity, DeliverySchedule, ContractStartDate, ContractEndDate) VALUES (supplycontract_seq.NEXTVAL, 2, 7, 59.99, 10, 'Monthly', TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD'));
INSERT INTO SupplyContract (ContractID, SupplierID, ProductID, SupplyPrice, MinimumOrderQuantity, DeliverySchedule, ContractStartDate, ContractEndDate) VALUES (supplycontract_seq.NEXTVAL, 3, 8, 59.99, 20, 'Every 3 Months', TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD'));
INSERT INTO SupplyContract (ContractID, SupplierID, ProductID, SupplyPrice, MinimumOrderQuantity, DeliverySchedule, ContractStartDate, ContractEndDate) VALUES (supplycontract_seq.NEXTVAL, 4, 9, 59.99, 15, 'Twice a Year', TO_DATE('2024-01-15', 'YYYY-MM-DD'), TO_DATE('2024-11-15', 'YYYY-MM-DD'));
INSERT INTO SupplyContract (ContractID, SupplierID, ProductID, SupplyPrice, MinimumOrderQuantity, DeliverySchedule, ContractStartDate, ContractEndDate) VALUES (supplycontract_seq.NEXTVAL, 5, 10, 59.99, 10, 'Monthly', TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD'));
INSERT INTO SupplyContract (ContractID, SupplierID, ProductID, SupplyPrice, MinimumOrderQuantity, DeliverySchedule, ContractStartDate, ContractEndDate) VALUES (supplycontract_seq.NEXTVAL, 1, 11, 59.99, 5, 'Monthly', TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD'));
INSERT INTO SupplyContract (ContractID, SupplierID, ProductID, SupplyPrice, MinimumOrderQuantity, DeliverySchedule, ContractStartDate, ContractEndDate) VALUES (supplycontract_seq.NEXTVAL, 2, 12, 49.99, 5, 'Monthly', TO_DATE('2024-01-01', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD'));
INSERT INTO SupplyContract (ContractID, SupplierID, ProductID, SupplyPrice, MinimumOrderQuantity, DeliverySchedule, ContractStartDate, ContractEndDate) VALUES (supplycontract_seq.NEXTVAL, 3, 13, 59.99, 10, 'Every 2 Months', TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD'));
INSERT INTO SupplyContract (ContractID, SupplierID, ProductID, SupplyPrice, MinimumOrderQuantity, DeliverySchedule, ContractStartDate, ContractEndDate) VALUES (supplycontract_seq.NEXTVAL, 4, 14, 69.99, 20, 'Quarterly', TO_DATE('2024-02-01', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD'));
INSERT INTO SupplyContract (ContractID, SupplierID, ProductID, SupplyPrice, MinimumOrderQuantity, DeliverySchedule, ContractStartDate, ContractEndDate) VALUES (supplycontract_seq.NEXTVAL, 5, 15, 59.99, 15, 'Monthly', TO_DATE('2024-03-01', 'YYYY-MM-DD'), TO_DATE('2024-12-31', 'YYYY-MM-DD'));

-- Insert Sample Data for Warehouses

INSERT INTO Warehouses (WarehouseID, Name, Location, Capacity) VALUES (warehouse_seq.NEXTVAL, 'Central Warehouse', '1234 Central Ave, Big City', 10000);
INSERT INTO Warehouses (WarehouseID, Name, Location, Capacity) VALUES (warehouse_seq.NEXTVAL, 'East Side Storage', '5678 Eastern St, Big City', 5000);

-- Insert Sample Data for WarehouseStorage (Associative Table). Includes details for all the products that the two warehouses have.

INSERT INTO WarehouseStorage (StorageID, WarehouseID, ProductID, Quantity, StorageConditions, EntryDate) VALUES (warehousestorage_seq.NEXTVAL, 1, 1, 20, 'Optimal Condition', TO_DATE('2024-01-01', 'YYYY-MM-DD'));
INSERT INTO WarehouseStorage (StorageID, WarehouseID, ProductID, Quantity, StorageConditions, EntryDate) VALUES (warehousestorage_seq.NEXTVAL, 2, 2, 15, 'Optimal Condition', TO_DATE('2024-01-02', 'YYYY-MM-DD'));
INSERT INTO WarehouseStorage (StorageID, WarehouseID, ProductID, Quantity, StorageConditions, EntryDate) VALUES (warehousestorage_seq.NEXTVAL, 1, 3, 30, 'Optimal Condition', TO_DATE('2024-01-03', 'YYYY-MM-DD'));
INSERT INTO WarehouseStorage (StorageID, WarehouseID, ProductID, Quantity, StorageConditions, EntryDate) VALUES (warehousestorage_seq.NEXTVAL, 2, 4, 25, 'Optimal Condition', TO_DATE('2024-01-04', 'YYYY-MM-DD'));
INSERT INTO WarehouseStorage (StorageID, WarehouseID, ProductID, Quantity, StorageConditions, EntryDate) VALUES (warehousestorage_seq.NEXTVAL, 1, 5, 10, 'Optimal Condition', TO_DATE('2024-01-05', 'YYYY-MM-DD'));
INSERT INTO WarehouseStorage (StorageID, WarehouseID, ProductID, Quantity, StorageConditions, EntryDate) VALUES (warehousestorage_seq.NEXTVAL, 2, 6, 5, 'Optimal Condition', TO_DATE('2024-01-06', 'YYYY-MM-DD'));
INSERT INTO WarehouseStorage (StorageID, WarehouseID, ProductID, Quantity, StorageConditions, EntryDate) VALUES (warehousestorage_seq.NEXTVAL, 1, 7, 40, 'Optimal Condition', TO_DATE('2024-01-07', 'YYYY-MM-DD'));
INSERT INTO WarehouseStorage (StorageID, WarehouseID, ProductID, Quantity, StorageConditions, EntryDate) VALUES (warehousestorage_seq.NEXTVAL, 2, 8, 35, 'Optimal Condition', TO_DATE('2024-01-08', 'YYYY-MM-DD'));
INSERT INTO WarehouseStorage (StorageID, WarehouseID, ProductID, Quantity, StorageConditions, EntryDate) VALUES (warehousestorage_seq.NEXTVAL, 1, 9, 20, 'Optimal Condition', TO_DATE('2024-01-09', 'YYYY-MM-DD'));
INSERT INTO WarehouseStorage (StorageID, WarehouseID, ProductID, Quantity, StorageConditions, EntryDate) VALUES (warehousestorage_seq.NEXTVAL, 2, 10, 15, 'Optimal Condition', TO_DATE('2024-01-10', 'YYYY-MM-DD'));
INSERT INTO WarehouseStorage (StorageID, WarehouseID, ProductID, Quantity, StorageConditions, EntryDate) VALUES (warehousestorage_seq.NEXTVAL, 1, 11, 30, 'Optimal Condition', TO_DATE('2024-01-11', 'YYYY-MM-DD'));
INSERT INTO WarehouseStorage (StorageID, WarehouseID, ProductID, Quantity, StorageConditions, EntryDate) VALUES (warehousestorage_seq.NEXTVAL, 2, 12, 25, 'Optimal Condition', TO_DATE('2024-01-12', 'YYYY-MM-DD'));
INSERT INTO WarehouseStorage (StorageID, WarehouseID, ProductID, Quantity, StorageConditions, EntryDate) VALUES (warehousestorage_seq.NEXTVAL, 1, 13, 10, 'Optimal Condition', TO_DATE('2024-01-13', 'YYYY-MM-DD'));
INSERT INTO WarehouseStorage (StorageID, WarehouseID, ProductID, Quantity, StorageConditions, EntryDate) VALUES (warehousestorage_seq.NEXTVAL, 2, 14, 5, 'Optimal Condition', TO_DATE('2024-01-14', 'YYYY-MM-DD'));
INSERT INTO WarehouseStorage (StorageID, WarehouseID, ProductID, Quantity, StorageConditions, EntryDate) VALUES (warehousestorage_seq.NEXTVAL, 1, 15, 40, 'Optimal Condition', TO_DATE('2024-01-15', 'YYYY-MM-DD'));

-- Insert Sample Data for Orders

INSERT INTO Orders (OrderID, OrderDate, CustomerInformation, OrderStatus) VALUES (order_seq.NEXTVAL, TO_DATE('2024-04-01', 'YYYY-MM-DD'), 'Customer A', 'Pending');
INSERT INTO Orders (OrderID, OrderDate, CustomerInformation, OrderStatus) VALUES (order_seq.NEXTVAL, TO_DATE('2024-04-02', 'YYYY-MM-DD'), 'Customer B', 'Shipped');
INSERT INTO Orders (OrderID, OrderDate, CustomerInformation, OrderStatus) VALUES (order_seq.NEXTVAL, TO_DATE('2024-04-03', 'YYYY-MM-DD'), 'Customer C', 'Delivered');
INSERT INTO Orders (OrderID, OrderDate, CustomerInformation, OrderStatus) VALUES (order_seq.NEXTVAL, TO_DATE('2024-04-04', 'YYYY-MM-DD'), 'Customer D', 'Pending');
INSERT INTO Orders (OrderID, OrderDate, CustomerInformation, OrderStatus) VALUES (order_seq.NEXTVAL, TO_DATE('2024-04-05', 'YYYY-MM-DD'), 'Customer E', 'Cancelled');
INSERT INTO Orders (OrderID, OrderDate, CustomerInformation, OrderStatus) VALUES (order_seq.NEXTVAL, TO_DATE('2024-04-06', 'YYYY-MM-DD'), 'Customer F', 'Pending');
INSERT INTO Orders (OrderID, OrderDate, CustomerInformation, OrderStatus) VALUES (order_seq.NEXTVAL, TO_DATE('2024-04-07', 'YYYY-MM-DD'), 'Customer G', 'Shipped');
INSERT INTO Orders (OrderID, OrderDate, CustomerInformation, OrderStatus) VALUES (order_seq.NEXTVAL, TO_DATE('2024-04-08', 'YYYY-MM-DD'), 'Customer H', 'Delivered');
INSERT INTO Orders (OrderID, OrderDate, CustomerInformation, OrderStatus) VALUES (order_seq.NEXTVAL, TO_DATE('2024-04-09', 'YYYY-MM-DD'), 'Customer I', 'Pending');
INSERT INTO Orders (OrderID, OrderDate, CustomerInformation, OrderStatus) VALUES (order_seq.NEXTVAL, TO_DATE('2024-04-10', 'YYYY-MM-DD'), 'Customer J', 'Cancelled');

-- Insert Sample Data for OrderDetail (Associative Table). Details of each one of the 10 orders above.

INSERT INTO OrderDetail (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES (orderdetail_seq.NEXTVAL, 1, 1, 1, 499.99);
INSERT INTO OrderDetail (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES (orderdetail_seq.NEXTVAL, 2, 2, 2, 499.99);
INSERT INTO OrderDetail (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES (orderdetail_seq.NEXTVAL, 3, 3, 3, 299.99);
INSERT INTO OrderDetail (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES (orderdetail_seq.NEXTVAL, 4, 4, 4, 69.99);
INSERT INTO OrderDetail (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES (orderdetail_seq.NEXTVAL, 5, 5, 5, 59.99);
INSERT INTO OrderDetail (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES (orderdetail_seq.NEXTVAL, 6, 6, 6, 69.99);
INSERT INTO OrderDetail (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES (orderdetail_seq.NEXTVAL, 7, 7, 7, 59.99);
INSERT INTO OrderDetail (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES (orderdetail_seq.NEXTVAL, 8, 8, 8, 59.99);
INSERT INTO OrderDetail (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES (orderdetail_seq.NEXTVAL, 9, 9, 9, 59.99);
INSERT INTO OrderDetail (OrderDetailID, OrderID, ProductID, Quantity, Price) VALUES (orderdetail_seq.NEXTVAL, 10, 10, 10, 59.99);

-- Insert sample data for shipments and shipment details, the associative table that links shipments to products.
-- I inserted 10 sample orders, so I will also insert 10 sample shipments and shipment details, one for each order.

-- Shipments
INSERT INTO Shipments (ShipmentID, ShipmentDate, Origin, Destination, Status) VALUES (shipment_seq.NEXTVAL, TO_DATE('2024-04-11', 'YYYY-MM-DD'), 'Central Warehouse', 'Customer A Address', 'In Transit');
INSERT INTO Shipments (ShipmentID, ShipmentDate, Origin, Destination, Status) VALUES (shipment_seq.NEXTVAL, TO_DATE('2024-04-12', 'YYYY-MM-DD'), 'Central Warehouse', 'Customer B Address', 'Delivered');
INSERT INTO Shipments (ShipmentID, ShipmentDate, Origin, Destination, Status) VALUES (shipment_seq.NEXTVAL, TO_DATE('2024-04-13', 'YYYY-MM-DD'), 'Central Warehouse', 'Customer C Address', 'Delivered');
INSERT INTO Shipments (ShipmentID, ShipmentDate, Origin, Destination, Status) VALUES (shipment_seq.NEXTVAL, TO_DATE('2024-04-14', 'YYYY-MM-DD'), 'Central Warehouse', 'Customer D Address', 'In Transit');
INSERT INTO Shipments (ShipmentID, ShipmentDate, Origin, Destination, Status) VALUES (shipment_seq.NEXTVAL, TO_DATE('2024-04-15', 'YYYY-MM-DD'), 'Central Warehouse', 'Customer E Address', 'Not Shipped');
INSERT INTO Shipments (ShipmentID, ShipmentDate, Origin, Destination, Status) VALUES (shipment_seq.NEXTVAL, TO_DATE('2024-04-16', 'YYYY-MM-DD'), 'Central Warehouse', 'Customer F Address', 'In Transit');
INSERT INTO Shipments (ShipmentID, ShipmentDate, Origin, Destination, Status) VALUES (shipment_seq.NEXTVAL, TO_DATE('2024-04-17', 'YYYY-MM-DD'), 'Central Warehouse', 'Customer G Address', 'In Transit');
INSERT INTO Shipments (ShipmentID, ShipmentDate, Origin, Destination, Status) VALUES (shipment_seq.NEXTVAL, TO_DATE('2024-04-18', 'YYYY-MM-DD'), 'Central Warehouse', 'Customer H Address', 'Delivered');
INSERT INTO Shipments (ShipmentID, ShipmentDate, Origin, Destination, Status) VALUES (shipment_seq.NEXTVAL, TO_DATE('2024-04-19', 'YYYY-MM-DD'), 'Central Warehouse', 'Customer I Address', 'In Transit');
INSERT INTO Shipments (ShipmentID, ShipmentDate, Origin, Destination, Status) VALUES (shipment_seq.NEXTVAL, TO_DATE('2024-04-20', 'YYYY-MM-DD'), 'Central Warehouse', 'Customer J Address', 'Not Shipped');

-- ShipmentDetails
INSERT INTO ShipmentDetail (ShipmentDetailID, ShipmentID, ProductID, Quantity, Condition) VALUES (shipmentdetail_seq.NEXTVAL, 1, 1, 1, 'New');
INSERT INTO ShipmentDetail (ShipmentDetailID, ShipmentID, ProductID, Quantity, Condition) VALUES (shipmentdetail_seq.NEXTVAL, 2, 2, 2, 'New');
INSERT INTO ShipmentDetail (ShipmentDetailID, ShipmentID, ProductID, Quantity, Condition) VALUES (shipmentdetail_seq.NEXTVAL, 3, 3, 3, 'New');
INSERT INTO ShipmentDetail (ShipmentDetailID, ShipmentID, ProductID, Quantity, Condition) VALUES (shipmentdetail_seq.NEXTVAL, 4, 4, 4, 'New');
INSERT INTO ShipmentDetail (ShipmentDetailID, ShipmentID, ProductID, Quantity, Condition) VALUES (shipmentdetail_seq.NEXTVAL, 5, 5, 5, 'New');
INSERT INTO ShipmentDetail (ShipmentDetailID, ShipmentID, ProductID, Quantity, Condition) VALUES (shipmentdetail_seq.NEXTVAL, 6, 6, 6, 'New');
INSERT INTO ShipmentDetail (ShipmentDetailID, ShipmentID, ProductID, Quantity, Condition) VALUES (shipmentdetail_seq.NEXTVAL, 7, 7, 7, 'New');
INSERT INTO ShipmentDetail (ShipmentDetailID, ShipmentID, ProductID, Quantity, Condition) VALUES (shipmentdetail_seq.NEXTVAL, 8, 8, 8, 'New');
INSERT INTO ShipmentDetail (ShipmentDetailID, ShipmentID, ProductID, Quantity, Condition) VALUES (shipmentdetail_seq.NEXTVAL, 9, 9, 9, 'New');
INSERT INTO ShipmentDetail (ShipmentDetailID, ShipmentID, ProductID, Quantity, Condition) VALUES (shipmentdetail_seq.NEXTVAL, 10, 10, 10, 'New');


-- Stored Procedure #1

-- The stored procedure will retrieve details about orders, including information from related tables like OrderDetail and Products.
-- This procedure shows how to join tables and apply filters within stored procedures.
-- It takes one parameter 'p_orderId' of type Orders.OrderID%TYPE

CREATE OR REPLACE PROCEDURE getOrderDetails (
	p_orderId IN Orders.OrderID%TYPE
) AS
-- Declare variables to hold the values that will be selected from the database
v_orderId Orders.OrderID%TYPE;
v_orderDate Orders.OrderDate%TYPE;
v_quantity OrderDetail.Quantity%TYPE;
v_productName Products.Name%TYPE;
v_unitPrice Products.UnitPrice%TYPE;
BEGIN
-- Select the OrderID, OrderDate, Quantity, Name, and UnitPrice from the respective tables
-- The values are selected based on the OrderID provided as a parameter to the procedure
SELECT o.OrderID, o.OrderDate, od.Quantity, p.Name, p.UnitPrice
INTO v_orderId, v_orderDate, v_quantity, v_productName, v_unitPrice
FROM Orders o
INNER JOIN OrderDetail od ON o.OrderID = od.OrderID
INNER JOIN Products p ON od.ProductID = p.ProductID
WHERE o.OrderID = p_orderId;

    -- Display the selected values using DBMS_OUTPUT.PUT_LINE
    DBMS_OUTPUT.PUT_LINE('Order ID: ' || v_orderId || ', Date: ' || v_orderDate || ', Product: ' || v_productName || ', Quantity: ' || v_quantity || ', Price: ' || v_unitPrice);
    EXCEPTION
    -- Handle the exception when no data is found for the provided OrderID
    WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('No order details found for OrderID: ' || p_orderId);
    -- Handle all other exceptions
    WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
    END;
    /


--Stored Function #1

-- The stored function will calculate the total value of an order.
-- This function can be used in queries to dynamically fetch the total cost of orders by summing the price of each product in the order details.
-- It takes one parameter 'p_orderId' of type Orders.OrderID%TYPE

CREATE OR REPLACE FUNCTION calculateOrderTotal(
	p_orderId IN Orders.OrderID%TYPE
) RETURN NUMBER IS  -- specify the precision and scale
-- Declare a variable to hold the total value of an order
v_total NUMBER(10,2) := 0;
BEGIN
-- Calculate the total value of an order by summing the product of quantity and unit price for each product in the order
-- The values are selected based on the OrderID provided as a parameter to the function
SELECT SUM(od.Quantity * p.UnitPrice)
INTO v_total
FROM OrderDetail od, Products p
WHERE od.ProductID = p.ProductID
AND od.OrderID = p_orderId
GROUP BY od.OrderID;

-- Return the total value of the order
RETURN v_total;
EXCEPTION
-- Handle the exception when no data is found for the provided OrderID
-- In this case, return 0 as the total value of the order
WHEN NO_DATA_FOUND THEN
RETURN 0;
-- Handle all other exceptions
-- In this case, re-raise the exception to be handled by the calling program
WHEN OTHERS THEN
RAISE;
END;
/


-- Commit everything
COMMIT;


-- QUERIES

-- A)

-- This query is designed to fetch details about pending orders,
-- including the order ID, order date, product name, quantity, unit price, total price, and shipment status.
-- It joins multiple tables to gather this information and uses the NVL function to handle null values in the shipment status.
-- The result is ordered by order ID and product name.

SELECT
o.OrderID,
o.OrderDate,
p.Name AS ProductName,
od.Quantity,
p.UnitPrice,
(od.Quantity * p.UnitPrice) AS TotalPrice,
    --If Status is null, replace it with 'Not Shipped'
    NVL(s.Status, 'Not Shipped') AS ShipmentStatus
    FROM
    Orders o
    INNER JOIN OrderDetail od ON o.OrderID = od.OrderID
    INNER JOIN Products p ON od.ProductID = p.ProductID
    LEFT JOIN ShipmentDetail sd ON p.ProductID = sd.ProductID
    LEFT JOIN Shipments s ON sd.ShipmentID = s.ShipmentID
    WHERE
    o.OrderStatus = 'Pending'
    ORDER BY
    o.OrderID, p.Name;


-- B)

-- For query (b), we'll explore the use of the UNION operator, which combines the results of two or more SELECT statements into a single result set,
-- including all rows belonging to all queries in the union. The requirement is to involve more than one table in the result.

SELECT
p.ProductID,
p.Name AS ProductName
FROM
Products p
INNER JOIN OrderDetail od ON p.ProductID = od.ProductID
UNION
SELECT
p.ProductID,
p.Name
FROM
Products p
INNER JOIN ShipmentDetail sd ON p.ProductID = sd.ProductID
ORDER BY ProductID;

-- This query aims to list all unique products involved either in shipments or orders, regardless of their status.
-- This demonstrates the ability to collate data from disparate parts of the database—showcasing products that are both ordered by customers and shipped.
-- It will use the Products, OrderDetail, and ShipmentDetail tables. The UNION operator ensures that each product is listed once even if it appears in both orders and shipments.

-- C)

-- This query demonstrates using custom data types in Oracle to manage supplier contact details for my scenario.
-- For this task, I grouped email, phone, and address into a 'ContactInfo' type, to meet the task requirement to use subtypes.
-- A stored function I created, get_supplier_contact_info,  combines these into a single string, and then we split them into separate columns for clarity.

SELECT
SupplierID,
Name,
    -- Extracts the email by parsing the concatenated string from the start to the first comma.
    SUBSTR(ContactInfo, 1, INSTR(ContactInfo, ',', 1, 1) - 1) AS Email,
    -- Extracts the phone number by locating the string between the first and second commas.
    SUBSTR(ContactInfo, INSTR(ContactInfo, ',', 1, 1) + 1, INSTR(ContactInfo, ',', 1, 2) - INSTR(ContactInfo, ',', 1, 1) - 1) AS Phone,
  -- Extracts the address by locating the substring after the second comma, illustrating how data within subtypes can be effectively managed and presented.
  SUBSTR(ContactInfo, INSTR(ContactInfo, ',', 1, 2) + 1) AS Address
  FROM (
  	SELECT SupplierID, Name, get_supplier_contact_info(SupplierID) AS ContactInfo
  	FROM Suppliers
  	);


-- D)

-- Query to retrieve orders placed within the first half of 2024 and calculate their total value using the stored function 'calculateOrderTotal'
-- This query demonstrates the use of Oracle SQL's temporal features by filtering orders based on their order dates
-- and integrates the use of a stored function to add dynamic computation within the query

SELECT
o.OrderID,
o.OrderDate,
o.CustomerInformation,
calculateOrderTotal(o.OrderID) AS TotalOrderValue
FROM
Orders o
WHERE
o.OrderDate BETWEEN TO_DATE('2024-01-01', 'YYYY-MM-DD') AND TO_DATE('2024-06-30', 'YYYY-MM-DD')
ORDER BY
o.OrderDate;

-- E)

-- Query to analyze product sales by category and month, demonstrating Oracle SQL's OLAP features
-- The query uses the ROLLUP function to provide subtotals by category and grand totals

SELECT
p.Category,
TO_CHAR(o.OrderDate, 'YYYY-MM') AS OrderMonth,
SUM(od.Quantity) AS TotalQuantitySold,
SUM(od.Quantity * p.UnitPrice) AS TotalSalesValue
FROM
OrderDetail od
JOIN
Orders o ON od.OrderID = o.OrderID
JOIN
Products p ON od.ProductID = p.ProductID
WHERE
    -- TEMPORAL FILTERING: Orders placed within the year 2024
    o.OrderDate BETWEEN TO_DATE('2024-01-01', 'YYYY-MM-DD') AND TO_DATE('2024-12-31', 'YYYY-MM-DD')
    GROUP BY
    -- ROLLUP provides subtotals by category and grand totals
    ROLLUP(p.Category, TO_CHAR(o.OrderDate, 'YYYY-MM'))
    ORDER BY
    p.Category, OrderMonth;
