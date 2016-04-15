//
//  ViewController.swift
//  tipsCalc
//
//  Created by WenLin on 2016/4/15.
//  Copyright © 2016年 WenLin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var amount: Float = 0.0
    var tipPercentage: Float = 0.0
    var taxPercentage: Float = 0.0
    var people: Int = 1
    
    @IBOutlet weak var tipPercentageTextField: UITextField!
    @IBOutlet weak var result: UITextField!
    @IBOutlet weak var taxPercentageTextField: UITextField!
    @IBOutlet weak var peopleTextField: UITextField!
    @IBOutlet weak var perPersonTextField: UITextField!

    @IBAction func amount(sender: UITextField) {
               if let amount = Float(sender.text!) {
            self.amount = amount
            
            setResult()
        }
        else {
            self.amount = 0
        }
        
    }
    
    @IBAction func tipPercentage(sender: UITextField) {
        if let tipPercentage = Float(sender.text!) {
            self.tipPercentage = tipPercentage
            setResult()
        }
        else {
            self.tipPercentage = 0
        }
        
    }
    
    @IBAction func tipSlider(sender: UISlider) {
        tipPercentage = sender.value
        tipPercentageTextField.text = String(Int(sender.value))
        setResult()
    }
    
    @IBAction func taxPercentage(sender: UITextField) {
        if let taxPercentage = Float(sender.text!) {
            self.taxPercentage = taxPercentage
            setResult()
        }
        else {
            self.taxPercentage = 0
        }
    }
    
    @IBAction func taxSlider(sender: UISlider) {
        taxPercentage = sender.value
        taxPercentageTextField.text = String(Int(sender.value))
        setResult()
    }
    
    @IBAction func peopleSlider(sender: UISlider) {
        people = Int(sender.value)
        peopleTextField.text = String( Int(sender.value) )
        setResult()
    }
    
    @IBAction func people(sender: UITextField) {
        if let people = Int(sender.text!) {
            self.people = people>0 ? people : 1
            setResult()
        }
        
        else {
            self.people = 1
        }

    
    }
    
    @IBAction func userTappedBackground(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setResult () {
        var bill:Float = 0.0
        bill = amount * (1 + tipPercentage/100 + taxPercentage/100)
        result.text = String( bill )
        perPersonTextField.text = String( bill / Float(people) )
        
    }




}

