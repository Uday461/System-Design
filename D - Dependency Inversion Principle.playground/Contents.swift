import UIKit

// D - Dependency Inversion Principle

// Class should depend on interfaces rather than concrete classes

// Let's say we got a project where we need to save the orders to DataBase storage for now and implement it as follows:

struct Order {
    let amount: Double
    let description: String
    let tax: Double
    let created_By: String
}

class Handler {
    let _orderDataBaseOperation: OrderDataBaseOperations
    
    init(_orderDataBaseOperation: OrderDataBaseOperations) {
        self._orderDataBaseOperation = _orderDataBaseOperation
    }

    func saveOrder(order: Order) {
        guard order.amount != 0 else {
            print("Entered Order amount should be greater than 0.")
            return
        }
        
        _orderDataBaseOperation.saveOrder(order: order)
    }
}

class OrderDataBaseOperations {
    func saveOrder(order: Order) {
        print("Order Saved Successfully. Order Value: \(order.amount) && Order Description: \(order.description)")
    }
}

let objHandler = Handler(_orderDataBaseOperation: OrderDataBaseOperations())
objHandler.saveOrder(order: Order(amount: 10.0, description: "Book", tax: 0, created_By: "ITC"))


// Now, in the above example if we see the Handler class initiailizer param '_orderDataBaseOperation' is tightly coupled (dependent)  with
// 'OrderDataBaseOperations' class. So, let's say in future requirement comes in where we need to need to save the orders to
// backend via API, then 'Handler' class is not extendable. The reason being our Class 'Handler' is dependent on the class 'OrderDataBaseOperation'. Instead we can make use of Interfaces/Protocols to make 'Handler' extendable. Let's see that below.

protocol OrderStorage {
    func saveOrder(order: Order)
}

class Handler1 {
    let orderStorageOperation: OrderStorage
    
    init(orderStorage: OrderStorage) {
        self.orderStorageOperation = orderStorage
    }

    func saveOrder(order: Order) {
        guard order.amount != 0 else {
            print("Entered Order amount should be greater than 0.")
            return
        }
        
        orderStorageOperation.saveOrder(order: order)
    }
}

class OrderDataBaseOperations1: OrderStorage {
    func saveOrder(order: Order) {
        print("Order Saved Successfully. Order Value: \(order.amount) && Order Description: \(order.description)")
    }
}

class OrderAPIOperation1: OrderStorage {
    func saveOrder(order: Order) {
        // Save order to backend via API.
    }
}

let obj1Handler1 = Handler1(orderStorage: OrderDataBaseOperations1())
obj1Handler1.saveOrder(order: Order(amount: 10.0, description: "Book", tax: 0, created_By: "ITC"))

let obj2Handler1 = Handler1(orderStorage: OrderAPIOperation1())
obj2Handler1.saveOrder(order: Order(amount: 10.0, description: "Book", tax: 0, created_By: "ITC"))

// As we can see above now the 'Handler1' class is not tightly coupled (not-dependent) with 'OrderDataBaseOperations1' class object. Instead it is dependent on protocol 'OrderStorage'. This can be implemented by 'OrderAPIOperation1' to save Orders to backend via API without any modifications required in 'Handler1' class.
