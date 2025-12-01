import UIKit

// 3.L -  Liskov Substitution Principle (LSP)

// If Class B is subtype of Class A, then we should be able to replace object of A
// with object of B without breaking the behaviour of the program.

// Subclass should extend the capability of parent class but not narrow it down.


// Let's consider 'Shape' SuperClass and 'Square' and 'Circle' SubClasses.

class Shape{
    func doSomethig() {
        
    }
}

class Square: Shape {
    func drawSquare() {
        print("Drawing Square!!.")
    }
}


class Circle: Shape {
    func drawCircle() {
        print("Drawing Circle!!.")
    }
}

func draw(shape: Shape) {
    if let square = shape as? Square {
        square.drawSquare()
    } else if let circle = shape as? Circle {
        circle.drawCircle()
    }
}


// We are breaking the LSP above because when the object of subclass type (Circle/Square) is passed to draw(shape:) method it will
// draw the shape, or else if the super class type object (Shape) is passed to draw(shape:) method it will do nothing.
// This is not expected, because whatever be the behaviour when we pass superclass object to the draw(shape:) method, it should
// be the same behaviour when we pass subclass type object to the draw(shape:) method.

// if we prefer composition over inheritance, we’ll solve that problem in an easier way. Creating a protocol to centralize the same behaviour that different classes should have is going to solve the LSP violation problem. See below example for not violating LSP.

protocol Shape1 {
    func draw()
}

class Circle1: Shape1 {
    func draw() {
        print("Drawing Circle1!!.")
    }
}

class Square1: Shape1 {
    func draw() {
        print("Drawing Square1!!.")
    }
}

func draw1(shape: Shape1) {
    shape.draw()
}

// So, now I have created classes conforming to protocol 'Shape1'. So, no matter whatever the class objects I pass that is conformed to protocol
// 'Shape1', the draw1(shape:) method will behave the same way.




// More Precise Example:

class Bird {
    func fly() {
        print("Bird is flying.")
    }
    
    func eat() {
        print("Bird is eating")
    }
}


class Sparrow: Bird {
    override func fly() {
        print("Sparrow is flying.")
    }
    
    override func eat() {
        print("Sparrow is eating")
    }
}


class Ostrich: Bird {
    override func fly() {
        fatalError("Penguin can't fly")
    }
    
    override func eat() {
        print("Penguin is eating")
    }
}


func makeBirdFly(bird: Bird) {
    bird.fly()
}

let commonBird = Bird()
makeBirdFly(bird: commonBird)

let sparrow = Sparrow()
makeBirdFly(bird: sparrow)


let ostrich = Ostrich()
// This call will crash the program at runtime, violating LSP!
// The client code (makeBirdFly) expects any Bird to be able to fly,
// but substituting an Ostrich breaks this expectation.
// makeBirdFly(bird: ostrich) // Uncommenting this will cause a crash



// MARK: - LSP Adherence Example (Good)

// Step 1: Define a more granular protocol for flying behavior
protocol Flyable {
    func fly()
}

// Step 2: Create a base Bird class that doesn't assume flying capability
class BirdV2 {
    func eat() {
        print("Bird (V2) is eating.")
    }
    // Other common bird behaviors (e.g., layEggs, chirp)
}

// Step 3: Specific types of birds inherit from BirdV2 and/or conform to Flyable
class SparrowV2: BirdV2, Flyable {
    func fly() {
        print("Sparrow (V2) is flying gracefully.")
    }

    override func eat() {
        print("Sparrow (V2) is pecking for food.")
    }
}

class OstrichV2: BirdV2 {
    // Ostriches only implement behaviors relevant to them
    func run() {
        print("Ostrich (V2) is running very fast!")
    }

    override func eat() {
        print("Ostrich (V2) is grazing.")
    }
}

// Step 4: Functions now operate on the appropriate types/protocols

// This function now specifically expects a Flyable object
func makeFlyableObjectFly(flyingObject: Flyable) {
    flyingObject.fly()
}

// This function operates on any BirdV2, focusing on common behaviors
func feedBird(bird: BirdV2) {
    bird.eat()
}

// --- Demonstration of LSP Adherence ---

let sparrowV2 = SparrowV2()
makeFlyableObjectFly(flyingObject: sparrowV2) // Output: Sparrow (V2) is flying gracefully.
feedBird(bird: sparrowV2)                   // Output: Sparrow (V2) is pecking for food.

let ostrichV2 = OstrichV2()
// makeFlyableObjectFly(flyingObject: ostrichV2) // Compile-time error! OstrichV2 does not conform to Flyable.
// This is GOOD! The compiler prevents the LSP violation before runtime.
feedBird(bird: ostrichV2)                       // Output: Ostrich (V2) is grazing.
ostrichV2.run()                                 // Output: Ostrich (V2) is running very fast!

let genericBirdV2 = BirdV2()
feedBird(bird: genericBirdV2)                   // Output: Bird (V2) is eating.
// makeFlyableObjectFly(flyingObject: genericBirdV2) // Compile-time error! BirdV2 does not conform to Flyable.
