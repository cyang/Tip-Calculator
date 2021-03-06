//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Christopher Yang on 12/10/15.
//  Copyright © 2015 Christopher Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var currencyLabel: UILabel!
    
    // Get local currency symbol
    let currencySymbol = NSLocale.currentLocale().objectForKey(NSLocaleCurrencySymbol) as! String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let index = defaults.integerForKey("index")
        
        var tipPercentages = [0.15, 0.2, 0.22]
        tipControl.selectedSegmentIndex = index

        calculateTipAndTotal(tipPercentages[index])
        
        
        // Set cursor at billField on open
        self.billField.becomeFirstResponder()
        
        // Set currency label from locale info
        currencyLabel.text = currencySymbol
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.15, 0.2, 0.22]
        let percentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        calculateTipAndTotal(percentage)
        
    }
    
    func calculateTipAndTotal(percentage: Double){
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * percentage
        let total = tip + billAmount
        
        // Set format for currency symbol and thousands separator
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.maximumFractionDigits = 2;
        
        tipLabel.text = formatter.stringFromNumber(tip)!
        totalLabel.text = formatter.stringFromNumber(total)!
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    
}

