//
//  SettingsViewController.swift
//  Tip Calculator
//
//  Created by Christopher Yang on 12/10/15.
//  Copyright © 2015 Christopher Yang. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {

    @IBOutlet weak var percentagePicker: UIPickerView!
    
    let pickerData = ["15%","20%","22%"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.percentagePicker.dataSource = self
        self.percentagePicker.delegate = self
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        print(row)
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(row, forKey: "index")
        defaults.synchronize()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let index = defaults.integerForKey("index")
        
        percentagePicker.selectRow(index, inComponent: 0, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
