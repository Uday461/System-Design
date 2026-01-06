//
//  ViewController.swift
//  FactoryPattern
//
//  Created by Banavath UdayKiran Naik on 20/12/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let shapeFactory = ShapeFactory()
        let shape = shapeFactory.getShape(input: "CIRCLE")
        shape?.draw()
    }


}

