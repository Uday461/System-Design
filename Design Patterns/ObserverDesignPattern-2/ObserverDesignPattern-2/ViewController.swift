//
//  ViewController.swift
//  ObserverDesignPattern-2
//
//  Created by Banavath UdayKiran Naik on 21/02/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addObservers()
        TaskManager.performTask()
    }
    
    func addObservers() {
        TaskManager.addObserver(Observer1())
        TaskManager.addObserver(Observer2())
        TaskManager.addObserver(Observer3())
    }

}

class Observer1: Observer {
    func update(data: String) {
        print("\(type(of: self)): Data: \(data)")
    }
}


class Observer2: Observer {
    func update(data: String) {
        print("\(type(of: self)): Data: \(data)")
    }
}

class Observer3: Observer {
    func update(data: String) {
        print("\(type(of: self)): Data: \(data)")
    }
}
