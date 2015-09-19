//
//  ViewController.swift
//  SchmidtTCalculator
//
//  Created by terry schmidt on 4/13/15.
//  Copyright (c) 2015 terry schmidt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userIsTypingNumber = false
    var firstNum = 0
    var secondNum: Int = 0
    var operatorToUse = ""
    
    @IBOutlet weak var calculatorDisplay: UILabel!
    
    @IBAction func numPressed(sender: UIButton) {
        let number = sender.currentTitle
        
        if userIsTypingNumber {
            calculatorDisplay.text = calculatorDisplay.text! + number!
        } else {
            calculatorDisplay.text = number
            userIsTypingNumber = true
        }
    }
    
    @IBAction func operatorPressed(sender: AnyObject) {
        userIsTypingNumber = false
        firstNum = Int(calculatorDisplay.text!)!
        operatorToUse = sender.currentTitle!!
    }
    
    @IBAction func equalsPressed(sender: AnyObject) {
        userIsTypingNumber = false
        var result = 0
        
        secondNum = Int(calculatorDisplay.text!)!
        
        switch operatorToUse {
            case "+": result = firstNum + secondNum
            case "-": result = firstNum - secondNum
            case "*": result = firstNum * secondNum
            case "/": result = firstNum / secondNum
            case "":  result = Int(calculatorDisplay.text!)!
            default: break
        }
        
        calculatorDisplay.text = "\(result)"
    }
    
    @IBAction func clearPressed(sender: AnyObject) {
        calculatorDisplay.text = "0"
        operatorToUse = ""
        firstNum = 0
        secondNum = 0
    }
    
}