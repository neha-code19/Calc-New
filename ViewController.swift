//
//  ViewController.swift
//  Assignment1
//
//  Created by Name: Sarthak Vashistha on 2022-09-24
//Student ID: 301245284
//Name: Neha patel
//Student ID:301280513
//This is the UI design of a calculator which has all the buttons in iphone 13 pro for IOS 16.0 in Xcode 14.0

import UIKit

enum Operation:String {
    case Add = "+"
    case Subtract = "-"
    case divide = "/"
    case Multiply = "x"
    case equal = "="
    case Null = "Null"
}

class ViewController: UIViewController {
    
    
    }
    
    //result label
    @IBOutlet weak var ResultLabel: UILabel!
    var pressedNumber = ""
    var LHS =  ""
    var RHS = ""
    var result = ""
    var currentOperation:Operation = .Null
    var percent = "100"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ResultLabel.text = "0"
        
    }
    //Event handlers
    
    
    @IBAction func All_Clear(_ sender: UIButton) {
        pressedNumber = ""
        LHS = ""
        RHS = ""
        result = ""
        currentOperation = .Null
        ResultLabel.text = "0"
    }
    
    
    @IBAction func backButton_Pressed(_ sender: UIButton) {
        pressedNumber = String(pressedNumber.dropLast(1))
        ResultLabel.text = pressedNumber
        
        if pressedNumber.isEmpty {
            pressedNumber = "0"
        }
        @IBAction func Percent_Press(_ sender: UIButton) {
        }
        
        
        @IBAction func PlusMinus_Press(_ sender: UIButton) {
            pressedNumber = String( ResultLabel.text!)
            pressedNumber = "-" + pressedNumber
            ResultLabel.text = pressedNumber
        }
        @IBAction func divide(_ sender: UIButton) {
            operation(operation: .divide)
            
        }
        
        
        @IBAction func Multiply(_ sender: UIButton) {
            operation(operation: .Multiply)
        }
        
        
        @IBAction func Add(_ sender: UIButton) {
            operation(operation: .Add)
        }
        
        
        @IBAction func subtract(_ sender: UIButton) {
            operation(operation: .Subtract)
        }
        
        
        @IBAction func Equals(_ sender: UIButton) {
            operation(operation: currentOperation)
        }
        
        
        @IBAction func dot(_ sender: UIButton) {
            if pressedNumber.count <= 7{
                pressedNumber += "."
                ResultLabel.text = pressedNumber
            }
        }
        
        
        
        
        
        
        func operation(operation: Operation){
            if currentOperation != .Null{
                if pressedNumber != "" {
                    RHS = pressedNumber
                    pressedNumber = ""
                    if currentOperation == .Add {
                        result = "\(Double(LHS)! + Double(RHS)!)"
                    }else if currentOperation == .Subtract{
                        result = "\(Double(LHS)! - Double(RHS)!)"
                    }else if currentOperation == .divide{
                        result = "\(Double(LHS)! / Double(RHS)!)"
                    }else if currentOperation == .Multiply{
                        result = "\(Double(LHS)! * Double(RHS)!)"
                    }else if currentOperation == .equal{
                        
                    }
                    LHS = result
                    if (Double(result)!.truncatingRemainder(dividingBy: 1) == 0){
                        result = "\(Int(Double(result)!))"
                    }
                    ResultLabel.text = result
                }
                currentOperation = operation
            }else {
                LHS = pressedNumber
                pressedNumber = ""
                currentOperation = operation
            }
        }
        @IBAction func NumberButton_Pressed(_ sender: UIButton) {
            if pressedNumber.count <= 8{
                pressedNumber += "\(sender.tag)"
                ResultLabel.text = pressedNumber
            }
            
            
            
        }
    }


        
        
        
        
    


