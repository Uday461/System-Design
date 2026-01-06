//
//  ShapeFactory.swift
//  FactoryPattern
//
//  Created by Banavath UdayKiran Naik on 20/12/25.
//

class ShapeFactory {
    func getShape(input: String) -> Shape? {
        switch input {
        case "CIRCLE": return Circle()
        case "RECTANGLE": return Rectangle()
        default:
            return nil
        }
    }
}
