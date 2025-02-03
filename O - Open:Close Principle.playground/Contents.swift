import UIKit

// 2.O -  Open for Extension but Closed for Modification.

// Let's take an example of below class 'InvoiceDao' where we have a functionality for saving some information to DB. Now let's say in future
// there comes a requirement for saving the same information to file, then you need to add the method in the class. In this case
// we are modifying the class, instead it's good to extend the functionality to other classes, with the help of protocols. In this
// way our code becomes readable and maintainable.

//DAO - Data Access Object.

class Marker {
    let price: Float
    let color: String
    let name: String
    
    init(price: Float, color: String, name: String) {
        self.price = price
        self.color = color
        self.name = name
    }
}

class Invoice {
    let marker:Marker
    let quantity: Int
    
    init(marker: Marker, quantity: Int) {
        self.marker = marker
        self.quantity = quantity
    }
    
    func returnTotalCost() -> Float{
        let totalCost:Float = self.marker.price * Float(self.quantity)
        return totalCost
    }
}

class InvoiceDao {
    let invoiceObj: Invoice
    
    init(invoiceObj: Invoice) {
        self.invoiceObj = invoiceObj
    }
    
    func saveToDB() {
        // Save To DB functionality.
    }
    
    // Adding the below saveToFile method as in when requirement comes in modifying the class 'InvoiceDao'
    func saveToFile() {
        // Save To File functionality
    }
}

// Instead of above approach where we add a method to save information to file when the requirement comes in, it's possible to extend a protocol
// method to different classes based on the functionality as in when requirement comes in.

protocol Save {
    func saveInformation()
}

class InvoiceSaveToDB: Save {
    func saveInformation() {
        //Save Information to DB.
    }
}

class InvoiceSaveToFile: Save {
    func saveInformation() {
        //Save Information to File.
    }
}
