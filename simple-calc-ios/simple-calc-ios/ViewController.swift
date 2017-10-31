//
//  ViewController.swift
//  simple-calc-ios
//
//  Created by iGuest on 10/23/17.
//  Copyright © 2017 iGuest. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    var displayNumber:Double = 0
    var firstNumber:Double = 0
    var currentArray = [Double]()
    var op = 0
    var performingOp = false
    var factorial = false
    var equationString = ""
    var equationArray = [String]()
    
    
    @IBAction func function(_ sender: UIButton) {
        if label.text != "" && sender.tag != 100 && sender.tag != 20 { // if display is empty, and user does not push = or clear
            if sender.tag == 19 { // fact
                var sum: Int = 1;
                let num = Int(label.text!)!
                equationString = label.text!
                for i in 1..<num + 1 {
                    sum = sum * i;
                }
                label.text = String(sum)
                equationString = "\(equationString) fact = \(sum)"
                equationArray.append(equationString)
            } else if sender.tag != 17 && sender.tag != 18 && sender.tag != 19 {
                op = sender.tag // save type
                performingOp = true;
                firstNumber = Double(label.text!)!
            } else {
                op = sender.tag
                firstNumber = Double(label.text!)!
                currentArray.append(firstNumber)
                label.text = ""
            }
        } else if sender.tag == 100 { //equals
            if op == 11 { // add
                label.text = String(firstNumber + displayNumber)
                let result = (label.text!)
                equationString = "\(firstNumber) + \(displayNumber) = \(result)"
                equationArray.append(equationString)
            } else if op == 12 { // subtract
                label.text = String(firstNumber - displayNumber)
                let result = (label.text!)
                equationString = "\(firstNumber) - \(displayNumber) = \(result)"
                equationArray.append(equationString)
            } else if op == 13 { // multiply
                label.text = String(firstNumber * displayNumber)
                let result = (label.text!)
                equationString = "\(firstNumber) * \(displayNumber) = \(result)"
                equationArray.append(equationString)
            } else if op == 14 { // divde
                label.text = String(firstNumber / displayNumber)
                let result = (label.text!)
                equationString = "\(firstNumber) / \(displayNumber) = \(result)"
                equationArray.append(equationString)
            } else if op == 15 { // mod
                label.text = String(firstNumber.truncatingRemainder(dividingBy: displayNumber))
                let result = (label.text!)
                equationString = "\(firstNumber) % \(displayNumber) = \(result)"
                equationArray.append(equationString)
            } else if op == 17 { // count
                firstNumber = Double(label.text!)!
                currentArray.append(firstNumber)
                label.text = String(currentArray.count)
                equationString = "\(dump(currentArray)) count \(label.text!)"
                equationArray.append(equationString)
            } else if op == 18 { // avg
                firstNumber = Double(label.text!)!
                currentArray.append(firstNumber)
                let sum = currentArray.reduce(0, +)
                label.text = String(sum/Double(currentArray.count))
                equationString = "\(dump(currentArray)) avg \(label.text!)"
                equationArray.append(equationString)
            }
        } else if sender.tag == 20 { // clear
            label.text = ""
            displayNumber = 0;
            firstNumber = 0;
            op = 0;
            currentArray = [Double]();
        }
        NSLog(String(describing: dump(equationArray)))
    }
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingOp == true {
            label.text = String(sender.tag)
            performingOp = false
        } else {
            label.text = label.text! + String(sender.tag)
        }
        displayNumber = Double(label.text!)!
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
   
    @IBAction func history(_ sender: Any) {
         performSegue(withIdentifier: "segue", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondary = segue.destination as! SecondViewController
        secondary.myString = equationArray

    }

    
}

