//
//  TaskManager.swift
//  ObserverDesignPattern-2
//
//  Created by Banavath UdayKiran Naik on 21/02/25.
//

import Foundation

protocol Observer {
    func update(data: String)
}

class TaskManager {
    private static var observers: [Observer] = []
    
    static func addObserver(_ observer: Observer) {
        observers.append(observer)
    }
    
    static func performTask() {
        notifiyObservers(data: "Hello World !!")
    }
    
    static func notifiyObservers(data: String) {
        for observer in observers {
            observer.update(data: data)
        }
    }
}
