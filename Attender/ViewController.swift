//
//  ViewController.swift
//  Attender
//
//  Created by Nathan Lanier on 10/4/15.
//  Copyright © 2015 Nathan Lanier. All rights reserved.
//
// Main View Controller

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate{


    @IBOutlet weak var selOrgs: UIPickerView!
    var orgDat = [""]
    var strSelOrg : String = ""
    var loadedB4 = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var textIn : NSString = ""
        selOrgs.dataSource = self
        selOrgs.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let file = "orglist.txt" //this is the file. we will write to and read from it
        
        if let dir : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
            let path = dir.stringByAppendingPathComponent(file)
            
            //reading
            do {
                textIn = try NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            }
            catch {/* error handling here */}
            
            }
        
        if loadedB4 == true {
            fillDat(textIn)
        }
        loadedB4 = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnRefresh(sender: UIButton) {
        viewDidLoad()
    }
    func fillDat (text2 : NSString){
        while text2 != "" {
            orgDat = text2.componentsSeparatedByString(",")
        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int{
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return orgDat.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return orgDat[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        strSelOrg = orgDat[row]
    }


}

