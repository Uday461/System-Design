import UIKit

// I - Interface Segmented Principle (ISP)

// Interfaces Segmented Principle states that the interfaces/protocols (here) should be such that client should not
// be implementing unnecessary functions they don't need.

// Let's take below example, I am creating a class 'Waiter', conforming to protocol 'RestaurantEmployee'. But, the 'Waiter' class responsibility would be to only serve customers with food but since we have declared all the  methods into a single protocol, we are forced to implement the methods which are not needed. Instead we can split them into different protocols, considering the responsibilites.

protocol RestaurantEmployee {
    func servesFood()
    func washDishes()
    func cookFood()
    func decideMenu()
}

class Waiter: RestaurantEmployee {
    func servesFood() {
        //Serve Food
    }
    
    func washDishes() {
        //Wash Dishes
    }
    
    func cookFood() {
        //Cook Food
    }
    
    func decideMenu() {
        //Decide Menu
    }
    
}

//Above example violates ISP. The answer to not violating the ISP would be creating multiple Interfaces/Protocols (here) and sharing the responsibilites accordingly. Below example illustrates that.

protocol WaiterProtocol {
    func servesFood()
}

protocol ChefProtocol {
    func decideMenu()
    func cookFood()
}

protocol HelperProtocol {
    func washDishes()
}


class Waiter1: WaiterProtocol {
    func servesFood() {
        // Serves Food
    }
}

class Chef: ChefProtocol {
    func decideMenu() {
        //Decide Menu
    }
    
    func cookFood() {
        //Cook Food
    }
}

class Helper: HelperProtocol {
    func washDishes() {
        //Wash Dishes
    }
}

// So, as we can see in the above classes, we didn't implement unnecessary methods which are not required. We have created
// different protocols and created classes inheriting them keeping in mind the responsibilities.
