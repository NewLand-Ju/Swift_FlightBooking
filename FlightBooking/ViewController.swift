//
//  ViewController.swift
//  FlightBooking
//
//  Created by JuDH on 2018. 1. 18..
//  Copyright © 2018년 JuDH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var departureDateButton: UIButton!
    @IBOutlet weak var returnDateLabel: UILabel!
    @IBOutlet weak var returnDateButton: UIButton!
    @IBOutlet weak var selectDatePicker: UIDatePicker!
    
    var buttonTag:Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        returnDateLabel.isHidden = true
        returnDateButton.isHidden = true
        selectDatePicker.isHidden = true
    }
    
    @IBAction func showDatePickerAction(_ sender: UIButton) {
        if selectDatePicker.isHidden {
            selectDatePicker.isHidden = false
        } else {
            selectDatePicker.isHidden = true
        }
        
        buttonTag = sender.tag
    }
    
    @IBAction func showReturnDateAction(_ sender: UISwitch) {
//        print(sender.description!)
//        if sender.isOn {
//            returnDateButton.isHidden = false
//            returnDateLabel.isHidden = false
//        } else {
//            returnDateButton.isHidden = true
//            returnDateLabel.isHidden = true
//        }
        returnDateButton.isHidden = !sender.isOn
        returnDateLabel.isHidden = !sender.isOn
    }
    
    @IBAction func selectedDateAction(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "YY-MM-dd hh:mma"
    
        let dateString = formatter.string(from: sender.date)
        
//        print(selectDatePicker.date)
//        print(sender.date)
        
        if buttonTag == 1 {
            departureDateButton.setTitle(dateString, for: UIControlState.normal)
        } else {
            returnDateButton.setTitle(dateString, for: UIControlState.normal)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        selectDatePicker.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

