// Drop Products collection
db.products.drop();

// Drop Orders collection
db.orders.drop();

// Drop Shipments collection
db.shipments.drop();


// Create the products collection
// Products also embed contracts with suppliers, as well as the warehouse storage information

db.products.insertMany([
{
	name: "PlayStation 5",
	description: "Latest generation console from Sony.",
	sku: "SKU-PS5",
	category: "Consoles",
	unitPrice: 499.99,
	quantityOnHand: 50,
	reorderPoint: 5,
	supplyContracts: [
	{
		supplierName: "Game World Inc.",
		contactDetails: {
			email: "contact@gameworld.com",
			phone: "123-456-7890",
			address: "123 Game Lane, Gametown, GT"
		},
		supplyPrice: 450,
		minimumOrderQuantity: 10,
		deliverySchedule: "Monthly",
		contractStartDate: ISODate("2024-01-01"),
		contractEndDate: ISODate("2024-12-31")
	}
	],
	warehouseStorage: [
	{
		warehouseName: "Central Warehouse",
		location: "1234 Central Ave, Big City",
		capacity: 10000,
		quantityStored: 20,
		storageConditions: "Optimal Condition",
		entryDate: ISODate("2024-01-01")
	},
	{
		warehouseName: "East Side Storage",
		location: "5678 Eastern St, Big City",
		capacity: 5000,
		quantityStored: 10,
		storageConditions: "Optimal Condition",
		entryDate: ISODate("2024-02-01")
	}
	]
},
{
	name: "Xbox Series X",
	description: "The fastest, most powerful Xbox ever.",
	sku: "SKU-XSX",
	category: "Consoles",
	unitPrice: 499.99,
	quantityOnHand: 50,
	reorderPoint: 5,
	supplyContracts: [
	{
		supplierName: "Tech Adventures",
		contactDetails: {
			email: "info@techadventures.com",
			phone: "234-567-8901",
			address: "456 Tech Park, Techville, TV"
		},
		supplyPrice: 450,
		minimumOrderQuantity: 5,
		deliverySchedule: "Monthly",
		contractStartDate: ISODate("2024-01-01"),
		contractEndDate: ISODate("2024-12-31")
	}
	],
	warehouseStorage: [
	{
		warehouseName: "Central Warehouse",
		location: "1234 Central Ave, Big City",
		capacity: 10000,
		quantityStored: 15,
		storageConditions: "Optimal Condition",
		entryDate: ISODate("2024-01-02")
	}
	]
},
{
	name: "Nintendo Switch",
	description: "Home gaming system that you can play on-the-go.",
	sku: "SKU-NSW",
	category: "Consoles",
	unitPrice: 299.99,
	quantityOnHand: 100,
	reorderPoint: 10,
	supplyContracts: [
	{
		supplierName: "Console Kings",
		contactDetails: {
			email: "sales@consolekings.com",
			phone: "345-678-9012",
			address: "789 Console Ave, Kingstown, KT"
		},
		supplyPrice: 270,
		minimumOrderQuantity: 15,
		deliverySchedule: "Every 2 Months",
		contractStartDate: ISODate("2024-01-15"),
		contractEndDate: ISODate("2024-11-15")
	}
	],
	warehouseStorage: [
	{
		warehouseName: "East Side Storage",
		location: "5678 Eastern St, Big City",
		capacity: 5000,
		quantityStored: 30,
		storageConditions: "Optimal Condition",
		entryDate: ISODate("2024-01-03")
	}
	]
},
{
	name: "DualSense Wireless Controller",
	description: "Next-gen controller for PlayStation 5.",
	sku: "SKU-DSWC",
	category: "Peripherals",
	unitPrice: 69.99,
	quantityOnHand: 200,
	reorderPoint: 20,
	supplyContracts: [
	{
		supplierName: "Virtual Fun",
		contactDetails: {
			email: "support@virtualfun.com",
			phone: "456-789-0123",
			address: "101 Virtual Road, Fun City, FC"
		},
		supplyPrice: 60,
		minimumOrderQuantity: 20,
		deliverySchedule: "Quarterly",
		contractStartDate: ISODate("2024-02-01"),
		contractEndDate: ISODate("2024-12-31")
	}
	],
	warehouseStorage: [
	{
		warehouseName: "Central Warehouse",
		location: "1234 Central Ave, Big City",
		capacity: 10000,
		quantityStored: 25,
		storageConditions: "Optimal Condition",
		entryDate: ISODate("2024-01-04")
	}
	]
},
{
	name: "Xbox Wireless Controller",
	description: "Enhanced comfort wireless controller for Xbox.",
	sku: "SKU-XWC",
	category: "Peripherals",
	unitPrice: 59.99,
	quantityOnHand: 200,
	reorderPoint: 20,
	supplyContracts: [
	{
		supplierName: "Epic Gaming Supplies",
		contactDetails: {
			email: "help@epicgamingsupplies.com",
			phone: "567-890-1234",
			address: "202 Game St, Epicburg, EP"
		},
		supplyPrice: 55,
		minimumOrderQuantity: 15,
		deliverySchedule: "Monthly",
		contractStartDate: ISODate("2024-03-01"),
		contractEndDate: ISODate("2024-12-31")
	}
	],
	warehouseStorage: [
	{
		warehouseName: "East Side Storage",
		location: "5678 Eastern St, Big City",
		capacity: 5000,
		quantityStored: 10,
		storageConditions: "Optimal Condition",
		entryDate: ISODate("2024-01-05")
	}
	]
},
{
	name: "Nintendo Switch Pro Controller",
	description: "Premium controller for Nintendo Switch.",
	sku: "SKU-NSPC",
	category: "Peripherals",
	unitPrice: 69.99,
	quantityOnHand: 150,
	reorderPoint: 15,
	supplyContracts: [
	{
		supplierName: "Game World Inc.",
		contactDetails: {
			email: "contact@gameworld.com",
			phone: "123-456-7890",
			address: "123 Game Lane, Gametown, GT"
		},
		supplyPrice: 65,
		minimumOrderQuantity: 10,
		deliverySchedule: "Monthly",
		contractStartDate: ISODate("2024-01-01"),
		contractEndDate: ISODate("2024-12-31")
	}
	],
	warehouseStorage: [
	{
		warehouseName: "Central Warehouse",
		location: "1234 Central Ave, Big City",
		capacity: 10000,
		quantityStored: 5,
		storageConditions: "Optimal Condition",
		entryDate: ISODate("2024-01-06")
	}
	]
},
{
	name: "The Legend of Zelda: Breath of the Wild",
	description: "Open-air adventure game for Nintendo Switch.",
	sku: "SKU-ZELDA",
	category: "Games",
	unitPrice: 59.99,
	quantityOnHand: 100,
	reorderPoint: 10,
	supplyContracts: [
	{
		supplierName: "Console Kings",
		contactDetails: {
			email: "sales@consolekings.com",
			phone: "345-678-9012",
			address: "789 Console Ave, Kingstown, KT"
		},
		supplyPrice: 50,
		minimumOrderQuantity: 10,
		deliverySchedule: "Every 2 Months",
		contractStartDate: ISODate("2024-01-15"),
		contractEndDate: ISODate("2024-11-15")
	}
	],
	warehouseStorage: [
	{
		warehouseName: "East Side Storage",
		location: "5678 Eastern St, Big City",
		capacity: 5000,
		quantityStored: 40,
		storageConditions: "Optimal Condition",
		entryDate: ISODate("2024-01-07")
	}
	]
},
{
	name: "Elden Ring",
	description: "Action RPG game for PlayStation 5 and Xbox Series X.",
	sku: "SKU-ELDR",
	category: "Games",
	unitPrice: 59.99,
	quantityOnHand: 150,
	reorderPoint: 15,
	supplyContracts: [
	{
		supplierName: "Tech Adventures",
		contactDetails: {
			email: "info@techadventures.com",
			phone: "234-567-8901",
			address: "456 Tech Park, Techville, TV"
		},
		supplyPrice: 50,
		minimumOrderQuantity: 20,
		deliverySchedule: "Every 3 Months",
		contractStartDate: ISODate("2024-02-01"),
		contractEndDate: ISODate("2024-12-31")
	}
	],
	warehouseStorage: [
	{
		warehouseName: "Central Warehouse",
		location: "1234 Central Ave, Big City",
		capacity: 10000,
		quantityStored: 35,
		storageConditions: "Optimal Condition",
		entryDate: ISODate("2024-01-08")
	}
	]
},
{
	name: "FIFA 24",
	description: "Latest installment of the FIFA series for all consoles.",
	sku: "SKU-FIFA24",
	category: "Games",
	unitPrice: 59.99,
	quantityOnHand: 200,
	reorderPoint: 20,
	supplyContracts: [
	{
		supplierName: "Epic Gaming Supplies",
		contactDetails: {
			email: "help@epicgamingsupplies.com",
			phone: "567-890-1234",
			address: "202 Game St, Epicburg, EP"
		},
		supplyPrice: 55,
		minimumOrderQuantity: 10,
		deliverySchedule: "Monthly",
		contractStartDate: ISODate("2024-03-01"),
		contractEndDate: ISODate("2024-12-31")
	}
	],
	warehouseStorage: [
	{
		warehouseName: "East Side Storage",
		location: "5678 Eastern St, Big City",
		capacity: 5000,
		quantityStored: 20,
		storageConditions: "Optimal Condition",
		entryDate: ISODate("2024-01-09")
	}
	]
},
{
	name: "Call of Duty: Vanguard",
	description: "First-person shooter for PlayStation 5 and Xbox Series X.",
	sku: "SKU-CODVG",
	category: "Games",
	unitPrice: 59.99,
	quantityOnHand: 150,
	reorderPoint: 15,
	supplyContracts: [
	{
		supplierName: "Game World Inc.",
		contactDetails: {
			email: "contact@gameworld.com",
			phone: "123-456-7890",
			address: "123 Game Lane, Gametown, GT"
		},
		supplyPrice: 55,
		minimumOrderQuantity: 15,
		deliverySchedule: "Monthly",
		contractStartDate: ISODate("2024-01-01"),
		contractEndDate: ISODate("2024-12-31")
	}
	],
	warehouseStorage: [
	{
		warehouseName: "Central Warehouse",
		location: "1234 Central Ave, Big City",
		capacity: 10000,
		quantityStored: 15,
		storageConditions: "Optimal Condition",
		entryDate: ISODate("2024-01-10")
	}
	]
}
]);




// Insert Orders
// Retrieve and store Product IDs in a map for easy access
var productIds = {};
var products = db.products.find({}, { name: 1 });
products.forEach(function(product) {
	productIds[product.name] = product._id;
});

// Begin inserting orders
db.orders.insertMany([
{
	orderDate: new Date("2024-04-01"),
	customerInformation: "Customer A",
	orderStatus: "Pending",
	orderItems: [
	{
		productId: productIds["PlayStation 5"],
		quantity: 1,
		price: 499.99
	},
	]
},
{
	orderDate: new Date("2024-04-02"),
	customerInformation: "Customer B",
	orderStatus: "Shipped",
	orderItems: [
	{
		productId: productIds["Xbox Series X"],
		quantity: 2,
		price: 499.99
	}
	]
},
{
	orderDate: new Date("2024-04-03"),
	customerInformation: "Customer C",
	orderStatus: "Delivered",
	orderItems: [
	{
		productId: productIds["Nintendo Switch"],
		quantity: 3,
		price: 299.99
	}
	]
},
{
	orderDate: new Date("2024-04-04"),
	customerInformation: "Customer D",
	orderStatus: "Pending",
	orderItems: [
	{
		productId: productIds["DualSense Wireless Controller"],
		quantity: 4,
		price: 69.99
	}
	]
},
{
	orderDate: new Date("2024-04-05"),
	customerInformation: "Customer E",
	orderStatus: "Cancelled",
	orderItems: [
	{
		productId: productIds["Xbox Wireless Controller"],
		quantity: 5,
		price: 59.99
	}
	]
},
{
	orderDate: new Date("2024-04-06"),
	customerInformation: "Customer F",
	orderStatus: "Pending",
	orderItems: [
	{
		productId: productIds["Nintendo Switch Pro Controller"],
		quantity: 6,
		price: 69.99
	}
	]
},
{
	orderDate: new Date("2024-04-07"),
	customerInformation: "Customer G",
	orderStatus: "Shipped",
	orderItems: [
	{
		productId: productIds["The Legend of Zelda: Breath of the Wild"],
		quantity: 7,
		price: 59.99
	}
	]
},
{
	orderDate: new Date("2024-04-08"),
	customerInformation: "Customer H",
	orderStatus: "Delivered",
	orderItems: [
	{
		productId: productIds["Elden Ring"],
		quantity: 8,
		price: 59.99
	}
	]
},
{
	orderDate: new Date("2024-04-09"),
	customerInformation: "Customer I",
	orderStatus: "Pending",
	orderItems: [
	{
		productId: productIds["FIFA 24"],
		quantity: 9,
		price: 59.99
	}
	]
},
{
	orderDate: new Date("2024-04-10"),
	customerInformation: "Customer J",
	orderStatus: "Cancelled",
	orderItems: [
	{
		productId: productIds["Call of Duty: Vanguard"],
		quantity: 10,
		price: 59.99
	}
	]
}
]);

// Insert Shipments

db.shipments.insertMany([
{
	shipmentDate: ISODate("2024-04-11T00:00:00Z"),
	origin: "Central Warehouse",
	destination: "Customer A Address",
	status: "In Transit",
	shipmentDetails: [
	{
		productId: productIds["PlayStation 5"],
		quantity: 1,
		condition: "New"
	}
	]
},
{
	shipmentDate: ISODate("2024-04-12T00:00:00Z"),
	origin: "Central Warehouse",
	destination: "Customer B Address",
	status: "Delivered",
	shipmentDetails: [
	{
		productId: productIds["Xbox Series X"],
		quantity: 2,
		condition: "New"
	}
	]
},
{
	shipmentDate: ISODate("2024-04-13T00:00:00Z"),
	origin: "Central Warehouse",
	destination: "Customer C Address",
	status: "Delivered",
	shipmentDetails: [
	{
		productId: productIds["Nintendo Switch"],
		quantity: 3,
		condition: "New"
	}
	]
},
{
	shipmentDate: ISODate("2024-04-14T00:00:00Z"),
	origin: "Central Warehouse",
	destination: "Customer D Address",
	status: "In Transit",
	shipmentDetails: [
	{
		productId: productIds["DualSense Wireless Controller"],
		quantity: 4,
		condition: "New"
	}
	]
},
{
	shipmentDate: ISODate("2024-04-15T00:00:00Z"),
	origin: "Central Warehouse",
	destination: "Customer E Address",
	status: "Not Shipped",
	shipmentDetails: [
	{
		productId: productIds["Xbox Wireless Controller"],
		quantity: 5,
		condition: "New"
	}
	]
},
{
	shipmentDate: ISODate("2024-04-16T00:00:00Z"),
	origin: "Central Warehouse",
	destination: "Customer F Address",
	status: "In Transit",
	shipmentDetails: [
	{
		productId: productIds["Nintendo Switch Pro Controller"],
		quantity: 6,
		condition: "New"
	}
	]
},
{
	shipmentDate: ISODate("2024-04-17T00:00:00Z"),
	origin: "Central Warehouse",
	destination: "Customer G Address",
	status: "In Transit",
	shipmentDetails: [
	{
		productId: productIds["The Legend of Zelda: Breath of the Wild"],
		quantity: 7,
		condition: "New"
	}
	]
},
{
	shipmentDate: ISODate("2024-04-18T00:00:00Z"),
	origin: "Central Warehouse",
	destination: "Customer H Address",
	status: "Delivered",
	shipmentDetails: [
	{
		productId: productIds["Elden Ring"],
		quantity: 8,
		condition: "New"
	}
	]
},
{
	shipmentDate: ISODate("2024-04-19T00:00:00Z"),
	origin: "Central Warehouse",
	destination: "Customer I Address",
	status: "In Transit",
	shipmentDetails: [
	{
		productId: productIds["FIFA 24"],
		quantity: 9,
		condition: "New"
	}
	]
},
{
	shipmentDate: ISODate("2024-04-20T00:00:00Z"),
	origin: "Central Warehouse",
	destination: "Customer J Address",
	status: "Not Shipped",
	shipmentDetails: [
	{
		productId: productIds["Call of Duty: Vanguard"],
		quantity: 10,
		condition: "New"
	}
	]
}
]);


// QUERIES

// A)

// This MongoDB aggregation fetches details about pending orders, including order ID, order date, product name, quantity, unit price, total price, and shipment status.

db.orders.aggregate([
{
    // Filter the orders collection to only include documents where the orderStatus is "Pending"
	$match: { "orderStatus": "Pending" }
},
{
    // Flatten the orderItems array in each document to create a new document for each item in the array
	$unwind: "$orderItems"
},
{
    // Join the orders collection with the products collection on the productId field
	$lookup: {
		from: "products",
		localField: "orderItems.productId",
		foreignField: "_id",
		as: "productDetails"
	}
},
{
    // Join the orders collection with the shipments collection on the productId field
	$lookup: {
		from: "shipments",
		localField: "_id",
		foreignField: "shipmentDetails.productId",
		as: "shipmentInfo"
	}
},
{
    // Select and transform the fields to include in the output documents
	$project: {
      orderID: "$_id", // Include the _id field as orderID
      orderDate: 1, // Include the orderDate field
      productName: { $arrayElemAt: ["$productDetails.name", 0] }, // Include the name field from the first document in the productDetails array
      quantity: "$orderItems.quantity", // Include the quantity field from the orderItems array
      unitPrice: { $arrayElemAt: ["$productDetails.unitPrice", 0] }, // Include the unitPrice field from the first document in the productDetails array
      totalPrice: {
        // Calculate the total price by multiplying the quantity by the unit price
      	$multiply: [
      		"$orderItems.quantity",
      		{ $arrayElemAt: ["$productDetails.unitPrice", 0] }
      		]
      },
      shipmentStatus: {
        // Include the status field from the first document in the shipmentInfo array, or "Not Shipped" if the array is empty
      	$ifNull: [ { $arrayElemAt: ["$shipmentInfo.status", 0] }, "Not Shipped" ]
      }
  }
},
{
    // Sort the output documents first by orderID in ascending order, then by productName in ascending order
	$sort: { "orderID": 1, "productName": 1 }
}
]);


// B)

// This query lists all unique products involved either in shipments or orders.

// Since MongoDB doesn't support a direct UNION operation within a single query,
// I had to fetch the data from the orders and shipments collections separately and then merge them, removing duplicates.

// This aggregation pipeline:

// Starts by matching products referenced in the orders collection.
// Projects the necessary product information.
// Uses $unionWith to combine the results with products found in the shipments collection, ensuring the products are included regardless of whether they are only in orders, only in shipments, or in both.
// Groups the results by ProductID to remove duplicates, ensuring each product is listed once.
// Projects the desired output format, mirroring the structure provided by the Oracle SQL query.

db.products.aggregate([
{
    // The $lookup stage performs a left outer join to the orders collection on the productId field.
    // The output documents contain a new array field "orderMatch" which contains the matching documents from the "orders" collection.
	$lookup: {
		from: "orders",
		localField: "_id",
		foreignField: "orderItems.productId",
		as: "orderMatch"
	}
},
{
    // The $match stage filters out the documents where the "orderMatch" array is empty,
    // meaning it only keeps the products that have appeared in orders.
	$match: {
		"orderMatch": { $ne: [] }
	}
},
{
    // The $project stage includes the fields ProductID and ProductName in the output documents.
	$project: {
		ProductID: "$_id",
		ProductName: "$name"
	}
},
{
    // The $unionWith stage performs a union of the output documents from the input pipeline with the output documents from the sub-pipeline.
    // The sub-pipeline unwinds the "shipmentDetails" array, performs a $lookup to the "products" collection, unwinds the resulting "productMatch" array,
    // and includes the fields ProductID and ProductName in the output documents.
	$unionWith: {
		coll: "shipments",
		pipeline: [
			{ $unwind: "$shipmentDetails" },
			{
				$lookup: {
					from: "products",
					localField: "shipmentDetails.productId",
					foreignField: "_id",
					as: "productMatch"
				}
			},
			{ $unwind: "$productMatch" },
			{
				$project: {
					ProductID: "$productMatch._id",
					ProductName: "$productMatch.name"
				}
			}
			]
	}
},
{
    // The $group stage groups the documents by ProductID and includes the first ProductName in each group of output documents.
	$group: {
		_id: "$ProductID",
		ProductName: { $first: "$ProductName" }
	}
},
{
    // The $project stage includes the fields ProductID and ProductName in the output documents and excludes the _id field.
	$project: {
		_id: 0,
		ProductID: "$_id",
		ProductName: 1
	}
}
])

// C)

// This query extracts supplier information from the products collection,
// where each supplier's contact details are embedded within the products they supply.
// The goal is to list each unique supplier along with their contact information,
// similar to how it's done in the iracke relational database.

db.products.aggregate([
{
    // The $unwind stage deconstructs the supplyContracts array field from the input documents
    // to output a document for each element. Each output document replaces the array with an element value.
	$unwind: "$supplyContracts"
},
{
    // The $group stage groups the documents by the supplierName field from the supplyContracts object.
    // It also gets the first occurrence of email, phone, and address for each grouped supplierName.
	$group: {
		_id: "$supplyContracts.supplierName",
		email: { $first: "$supplyContracts.contactDetails.email" },
		phone: { $first: "$supplyContracts.contactDetails.phone" },
		address: { $first: "$supplyContracts.contactDetails.address" }
	}
},
{
    // The $project stage passes along the documents with the requested fields to the next stage in the pipeline.
    // The specified fields to include are supplierName (which is the _id from the $group stage), email, phone, and address.
	$project: {
		_id: 0,
		supplierName: "$_id",
		email: 1,
		phone: 1,
		address: 1
	}
}
]);


// D)

// This query demonstrates the use of MongoDB's aggregation pipeline
// to filter orders within a date range and calculate the total value of each order.

db.orders.aggregate([
{
    // The $match stage filters the orders collection to only include documents where the orderDate is between "2024-01-01" and "2024-06-30"
	$match: {
		orderDate: { $gte: ISODate("2024-01-01"), $lte: ISODate("2024-06-30") }
	}
},
{
    // The $unwind stage deconstructs the orderItems array field from the input documents to output a document for each element
	$unwind: "$orderItems"
},
{
    // The $lookup stage performs a left outer join to the products collection on the productId field
    // The output documents contain a new array field "productInfo" which contains the matching documents from the "products" collection
	$lookup: {
		from: "products",
		localField: "orderItems.productId",
		foreignField: "_id",
		as: "productInfo"
	}
},
{
    // The $addFields stage adds new fields to the documents
    // The "productInfo" field is set to the first element of the "productInfo" array
	$addFields: {
		"productInfo": { $arrayElemAt: ["$productInfo", 0] }
	}
},
{
    // The $group stage groups the documents by the _id field
    // It also calculates the totalOrderValue by multiplying the quantity and unitPrice for each orderItem
    // The first occurrence of orderDate and customerInformation for each group is also included in the output documents
	$group: {
		_id: "$_id",
		totalOrderValue: {
			$sum: {
				$multiply: ["$orderItems.quantity", "$productInfo.unitPrice"]
			}
		},
		orderDate: { $first: "$orderDate" },
		customerInformation: { $first: "$customerInformation" }
	}
},
{
    // The $project stage includes the fields orderID, orderDate, customerInformation, and totalOrderValue in the output documents
    // The _id field is excluded from the output documents
	$project: {
		_id: 0,
		orderID: "$_id",
		orderDate: 1,
		customerInformation: 1,
		totalOrderValue: 1
	}
}
]);


// E)

// This aggregation calculates total sales by product category and month,
// including subtotals and grand totals

db.orders.aggregate([
{
    // The $unwind stage deconstructs the orderItems array field from the input documents to output a document for each element
	$unwind: "$orderItems"
},
{
    // The $lookup stage performs a left outer join to the products collection on the productId field
    // The output documents contain a new array field "productInfo" which contains the matching documents from the "products" collection
	$lookup: {
		from: "products",
		localField: "orderItems.productId",
		foreignField: "_id",
		as: "productInfo"
	}
},
{
    // The $unwind stage deconstructs the productInfo array field from the input documents to output a document for each element
	$unwind: "$productInfo"
},
{
    // The $addFields stage adds new fields to the documents
    // The "orderMonth" field is set to the month and year of the "orderDate" field
	$addFields: {
		orderMonth: {
			$dateToString: { format: "%Y-%m", date: "$orderDate" }
		}
	}
},
{
    // The $group stage groups the documents by the category field from the productInfo object and the orderMonth field
    // It also calculates the totalQuantitySold and totalSalesValue for each group
	$group: {
		_id: {
			category: "$productInfo.category",
			month: "$orderMonth"
		},
		totalQuantitySold: { $sum: "$orderItems.quantity" },
		totalSalesValue: { $sum: { $multiply: ["$orderItems.quantity", "$productInfo.unitPrice"] } }
	}
},
{
    // The $group stage groups the documents by the category field
    // It also pushes the month, totalQuantitySold, and totalSalesValue fields to the salesInfo array for each group
	$group: {
		_id: "$_id.category",
		salesInfo: {
			$push: {
				month: "$_id.month",
				totalQuantitySold: "$totalQuantitySold",
				totalSalesValue: "$totalSalesValue"
			}
		}
	}
},
{
    // The $sort stage sorts the documents by the category field in ascending order
	$sort: { "_id": 1 }
}
]);


//Oracle's ROLLUP feature creates detailed summaries, including subtotals and a grand total, which is why we see more rows in its output.
// MongoDB, lacking a direct ROLLUP equivalent, gives us simpler aggregations with fewer rows because it doesn't automatically include those extra summary levels.