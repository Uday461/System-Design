//
//  ToppingDecorator.swift
//  Decorator Pattern
//
//  Created by Banavath UdayKiran Naik on 22/03/25.
//

protocol ToppingDecorator: BasePizza {
    var basePizza: BasePizza { get }
}
