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
