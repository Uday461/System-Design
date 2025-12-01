//
//  ExtraCheeseDecorator.swift
//  Decorator Pattern
//
//  Created by Banavath UdayKiran Naik on 22/03/25.
//

class ExtraCheeseDecorator: ToppingDecorator {
    var basePizza: BasePizza
    
    init(basePizza: BasePizza) {
        self.basePizza = basePizza
    }
    
    func cost() -> Int {
        self.basePizza.cost() + 20
    }
}

class JalapenoPopperDecorator: ToppingDecorator {
    var basePizza: BasePizza
    
    init(basePizza: BasePizza) {
        self.basePizza = basePizza
    }
    
    func cost() -> Int {
        self.basePizza.cost() + 15
    }
}
