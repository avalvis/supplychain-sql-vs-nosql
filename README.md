# **Inventory and Supply Chain Management Database**

## **Project Overview**

This project demonstrates the implementation of an Inventory and Supply Chain Management system using both relational and NoSQL database technologies: Oracle and MongoDB. The use case involves managing products, suppliers, orders, and shipments within a supply chain network.

## **UML Class Diagram**

![DB-UML drawio](https://github.com/avalvis/supplychain-sql-vs-nosql/assets/115991962/9aebf199-8e48-429e-bce4-128b2d7dd048)


## **Repository Structure**

- **`oracle_scripts.sql`** - Contains all SQL scripts for the Oracle database. This includes table creation, data insertion, and queries for various operations.
- **`mongodb_scripts.js`** - Contains MongoDB setup commands and queries, which cover data insertion into collections and several examples of data aggregation and retrieval.

## **Technologies Used**

- **Oracle Database**: Used for structured data involving complex joins and transactions.
- **MongoDB**: Utilized for its flexible schema and efficient handling of nested documents and arrays, ideal for less structured data.

## **Setup Instructions**

### **Oracle Database**

1. **Install Oracle Database**: Ensure Oracle Database is installed and running on your system.
2. **Create Schema**: Log into your Oracle database and execute the **`oracle_scripts.sql`** to set up the schema, including table creation and initial data loading.

### **MongoDB**

1. **Install MongoDB**: Make sure MongoDB is installed and running on your machine.
2. **Initialize the Database**: Run the **`mongodb_scripts.js`** script in your MongoDB environment to create collections and insert data.

## **Running the Scripts**

### **Oracle**

- You can run the scripts using SQL Developer or any other Oracle-compatible SQL client.
- Load the **`oracle_scripts.sql`** file and execute it to perform the database operations.

### **MongoDB**

- Use the MongoDB shell or a GUI like MongoDB Compass to run the JavaScript commands.
- Load the **`mongodb_scripts.js`** file into your MongoDB execution environment and run it to set up your collections and documents.

## **Sample Queries**

This section contains a few examples of queries for both Oracle and MongoDB that demonstrate how to interact with the data in the context of inventory and supply chain management. These include fetching order details, product shipments, and supplier contracts.

### **Oracle**

- **Fetch Pending Orders**: Retrieves details about all pending orders including order ID, date, and items.
    
    ```sql
    SELECT o.OrderID, o.OrderDate, p.Name AS ProductName, ...
    
    ```
    

### **MongoDB**

- **Pending Orders Aggregation**: An example of an aggregation query to fetch pending orders and associated products.
    
    ```jsx
    db.orders.aggregate([...])
    
    ```
    

## **Contributing**

Feel free to fork this project and contribute by adding more complex queries or enhancing the database schema. Pull requests are welcome.
