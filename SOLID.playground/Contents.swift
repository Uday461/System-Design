import UIKit

// SOLID Principles

// 1. Single Responsibility Principle - A Class should have only reason to change.

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

// If we see the below Invoice Class, the class can get changed because of change in the way we are calculating the totalCost or
// It can change if we change the implementation in how we printInvoice
// It can also change if we change the implementation in saving to DB
// So, in total the class has 3 reasons to change, but it should be not that case.
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
    
    func printInvoice() {
        // Printing Invoice Functionality
    }
    
    func saveToDB() {
        // Saving To DB Functionality
    }
}


// So, as we can see below we have split the responsibility into different classes, so now a Class that is (Invoice2, InvoicePrinter, InvoiceSaveToDB) has only a single reason to change unlike above.

class Invoice2 {
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

class InvoicePrinter {
    let invoice2: Invoice2
    
    init(invoice2: Invoice2) {
        self.invoice2 = invoice2
    }
    
    func printInvoice() {
        // Printing Invoice Functionality
    }
}

class InvoiceSaveToDB {
    let invoice2: Invoice2
    
    init(invoice2: Invoice2) {
        self.invoice2 = invoice2
    }
    
    func saveToDB() {
        // Saving To DB Functionality
    }
}

