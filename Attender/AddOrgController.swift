//
//  AddOrgController.swift
//  Attender
//
//  Created by Nathan Lanier on 10/4/15.
//  Copyright © 2015 Nathan Lanier. All rights reserved.
//

import Foundation
import UIKit

class AddOrgController : UIViewController,UIPickerViewDataSource,UIPickerViewDelegate, UITextFieldDelegate{

    @IBOutlet weak var selDay: UIPickerView!
    @IBOutlet weak var txtOrgName: UITextField!
    @IBOutlet weak var txtUrl: UITextField!
    
    //var OrgList = Master
    //var newOrg = Organization ()
    var strDay : String = ""
    
    
    let selDayData = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        selDay.dataSource = self
        selDay.delegate = self
        self.txtOrgName.delegate = self
        self.txtUrl.delegate = self
        
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return selDayData.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return selDayData[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        strDay = selDayData[row]
    }
    
    @IBAction func btnDone(sender: UIButton) {
        saveOrg()
    }
    func saveOrg () {
        var newOrg = Organization(name: txtOrgName.text!, day: strDay, url: txtUrl.text!)
        
        let file = txtOrgName.text! + ".txt" //this is the file. we will write to and read from it
        
        let text = "Org Name: " + newOrg.name + "\nMeeting Day: " + newOrg.day + "\nWebsite: " + newOrg.url //just a text
        
        if let dir : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
            let path = dir.stringByAppendingPathComponent(file);
            
            //writing
            do {
                try text.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding)
            }
            catch {/* error handling here */}
            addOrgToList(newOrg)
    }
    }
    
    func addOrgToList (wrtOrg : Organization) {
        let file = "orglist.txt" //this is the file. we will write to and read from it
        
        let text = wrtOrg.name + "," //just a text
        
        if let dir : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
            let path = dir.stringByAppendingPathComponent(file);
            
            //writing
            do {
                try text.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding)
            }
            catch {/* error handling here */}
        }
    }
    
    
}