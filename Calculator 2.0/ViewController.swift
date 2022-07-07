//
//  ViewController.swift
//  Calculator 2.0
//
//  Created by Дарья Бирюкова on 06.07.2022.
//

import UIKit

enum Operation:String {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
    case NULL = "Null"
}

class ViewController: UIViewController {
    
    @IBOutlet weak var viewResult: UILabel!
    var runningNumber: String = ""
    var firstNumber:String = ""
    var secondNumber: String = ""
    var resultNumber:String = ""
    var currentOperation:Operation = .NULL
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewResult.text = "0"
    }


    @IBAction func buttonNumber(_ sender: RoundButton) {
        if runningNumber.count <= 8 {
        runningNumber += "\(sender.tag)"
        viewResult.text = runningNumber
    }
}
    
    @IBAction func buttonOperation(_ sender: RoundButton) {
        let tag = sender.tag
        
        if tag == 10 {
            operation(operation: .add)
        }
        else if tag == 11 {
            operation(operation: .subtract)
        }
        else if tag == 12 {
            operation(operation: .multiply)
        }
        else if tag == 13 {
            operation(operation: .divide)
        }
        else if tag == 14 {
            operation(operation: currentOperation)
        }
    }
    
    func operation(operation: Operation) {
        if currentOperation != .NULL {
        if runningNumber != "" {
            secondNumber = runningNumber
            runningNumber = ""
                
            switch currentOperation {
            case .add:
                resultNumber = "\(Double(firstNumber)! + Double(secondNumber)!)"
            case .subtract:
                resultNumber = "\(Double(firstNumber)! - Double(secondNumber)!)"
            case .multiply:
                resultNumber = "\(Double(firstNumber)! * Double(secondNumber)!)"
            case .divide:
                resultNumber = "\(Double(firstNumber)! / Double(secondNumber)!)"
            case .NULL:
                resultNumber = "0"
            }
            
            firstNumber = resultNumber
            viewResult.text = resultNumber
        }
        currentOperation = operation
    } else {
        firstNumber = runningNumber
        runningNumber = ""
        currentOperation = operation
    }
}
    
    @IBAction func buttonAllClean(_ sender: RoundButton) {
        runningNumber = ""
        firstNumber = ""
        secondNumber = ""
        resultNumber = ""
        currentOperation = .NULL
        viewResult.text = "0"
    }
    
    @IBAction func buttonPlusMinus(_ sender: RoundButton) {
        runningNumber = "\(-Double(runningNumber)!)"
        viewResult.text = runningNumber
    }
    
    @IBAction func buttonPercent(_ sender: RoundButton) {
        runningNumber = "\((Double(runningNumber)!)/100)"
        viewResult.text = runningNumber
    }
    
    @IBAction func dotButton(_ sender: RoundButton) {
        if runningNumber.count <= 7 {
        runningNumber += "."
        viewResult.text = runningNumber
        }
    }
    
}
