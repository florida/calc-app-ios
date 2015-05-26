//
//  ViewController.swift
//  calc
//
//  Created by Florida Elago on 2015-05-18.
//  Copyright (c) 2015 Florida Elago. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    
    var userIsTyping = false
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!

        if userIsTyping {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userIsTyping = true
        }

    }

    @IBAction func operate(sender: UIButton) {
        if userIsTyping {
            enter()
        }
        let operation = sender.currentTitle!
        switch operation {
        case "×": performOperation({(op1: Double, op2: Double) -> Double in return op1 * op2})
        case "÷": performOperation({(op1: Double, op2: Double) -> Double in return op1 / op2})
        case "+": performOperation({(op1: Double, op2: Double) -> Double in return op1 + op2})
        case "−": performOperation({(op1: Double, op2: Double) -> Double in return op1 - op2})
        default: break
        }
    }
    
    func performOperation(operation: (Double,Double) -> Double) {
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack .removeLast())
            enter()
        }
    }

    
    var operandStack = Array<Double>()
    @IBAction func enter() {
        userIsTyping = false;
        operandStack.append(displayValue);
    }
    
    var displayValue: Double {
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            userIsTyping = false
        }
    }
}

