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
    
    var timerCount = 0
    var timerRunning = false
    
    @IBOutlet weak var timerLabel: UILabel! //ADD Label
    @IBOutlet weak var textField: UITextField! //Add TextFiled /Enter any number to Countdown
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Reset
        timerLabel.text = ""
        if timerCount == 0 {
            timerRunning = false
        }
}
    
       //Figure out Count method
    func Counting() {
        if timerCount > 0 {
        timerLabel.text = "\(timerCount)"
            timerCount -= 1
        } else {
            timerLabel.text = "GO!"
            
        }
        
    }
    
    //ADD Action Button
    @IBAction func startButton(sender: UIButton) {
        
        //Figure out timer
        if timerRunning == false {
         _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.Counting), userInfo: nil, repeats: true)
            timerRunning = true
        }
        
        //unwrap textField and Display result
        if let countebleNumber = Int(textField.text!) {
            timerCount = countebleNumber
            textField.text = "" //Clean Up TextField
        } else {
            timerCount = 3 //Defoult Number to Countdown if TextField is nil
            textField.text = "" //Clean Up TextField
        }
       
    }
    
    //Dismiss keyboard
    func keyboardDismiss() {
        textField.resignFirstResponder()
    }
    
    //ADD Gesture Recignizer to Dismiss keyboard then view tapped
    @IBAction func viewTapped(_ sender: AnyObject) {
        keyboardDismiss()
    }
    
    //Dismiss keyboard using Return Key (Done) Button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        keyboardDismiss()
        
        return true
    }
    
}




