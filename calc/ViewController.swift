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
        let operation = sender.currentTitle!
        switch operation {
        case "×":
        case "÷":
        case "+": 
        case "−":
            default: break
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

