//
//  ViewController.swift
//  Decorator Pattern
//
//  Created by Banavath UdayKiran Naik on 22/03/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(findCostOfMargeritaWithExtraCheese()) //120
        print(findCostOfMargeritaWithExtraCheeseWithJalepino()) //135
    }
    
    func findCostOfMargeritaWithExtraCheese() -> Int {
        let extraCheeseDecorator = ExtraCheeseDecorator(basePizza: Margherita())
        return extraCheeseDecorator.cost()
    }
    
    func findCostOfMargeritaWithExtraCheeseWithJalepino() -> Int {
        let jalepinoDecorator = JalapenoPopperDecorator(basePizza: ExtraCheeseDecorator(basePizza: Margherita()))
        return jalepinoDecorator.cost()
    }
}

