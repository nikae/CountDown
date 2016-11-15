//
//  ViewController.swift
//  CountDown
//
//  Created by Nika on 11/10/16.
//  Copyright © 2016 Nika. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    
    var timerCount = 3
    var timerRunning = false
    var timer = Timer()
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    
    func Counting() {
        if timerCount > 0 {
        timerLabel.text = "\(timerCount)"
            timerCount -= 1
        } else {
            timerLabel.text = "GO!"
            
        }
        
    }
    
    

    
    @IBAction func startButton(sender: UIButton) {
        if timerRunning == false {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.Counting), userInfo: nil, repeats: true)
            timerRunning = true
        }
  //unwrap textField
     
        if let countebleNumber = Int(textField.text!) {
            timerCount = countebleNumber
            textField.text = ""
        } else {
            timerCount = 3
            textField.text = ""
        }
        
        
    }
    
    
    //dismise keyBoard
    
    func keyboardDismiss() {
        textField.resignFirstResponder()
    
    }
    
    @IBAction func viewTapped(_ sender: AnyObject) {
        keyboardDismiss()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        keyboardDismiss()
        
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerLabel.text = ""
        // Do any additional setup after loading the view, typically from a nib.
        if timerCount == 0 {
            timerRunning = false
        }
    }
}




