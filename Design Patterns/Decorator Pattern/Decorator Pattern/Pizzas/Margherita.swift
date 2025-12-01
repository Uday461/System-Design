//
//  argherita.swift
//  Decorator Pattern
//
//  Created by Banavath UdayKiran Naik on 22/03/25.
//

class Margherita: BasePizza {
    func cost() -> Int {
        return 100
    }
}


class VegDelight: BasePizza {
    func cost() -> Int {
        return 150
    }
}

class JalapenoPopper: BasePizza {
    func cost() -> Int {
        return 200
    }
}
