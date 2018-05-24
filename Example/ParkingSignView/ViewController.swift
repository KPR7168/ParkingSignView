//
//  ViewController.swift
//  ParkingSign
//
//  Created by Ky Pichratanak on 21/5/18.
//  Copyright © 2018 Ky Pichratanak. All rights reserved.
//

import UIKit
import ParkingSignView

class ViewController: UIViewController {
    var signView: ParkingSignView!
    @IBOutlet weak var firstFromDate: UITextField!
    @IBOutlet weak var firstToDate: UITextField!
    @IBOutlet weak var secondFromDate: UITextField!
    @IBOutlet weak var secondToDate: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        var sampleDate = DateComponents()
//        sampleDate.hour = 8
//        sampleDate.minute = 30
//        sampleDate.weekday = WeekDay.Monday.rawValue
//
//        var sampleDate1 = DateComponents()
//        sampleDate1.hour = 4
//        sampleDate1.minute = 3
//        sampleDate1.weekday = WeekDay.Thursday.rawValue
        
        self.signView = ParkingSignView(duration: 1, unit: .hour)
        self.signView.center = self.view.center
        self.view.addSubview(signView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func slider(_ sender: Any) {
        let slider = sender as! UISlider
        self.signView.duration = Int(slider.value)
    }
    
    @IBAction func textFieldInput(_ sender: Any) {
        let textInput = sender as! UITextField
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.dateAndTime
        datePickerView.tag = textInput.tag
        textInput.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: UIControlEvents.valueChanged)
    }
    
    @objc func datePickerValueChanged(sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .short
        
        let dateComponent = sender.calendar.dateComponents(in: sender.calendar.timeZone, from: sender.date)
        
        switch sender.tag {
        case 0:
            self.firstFromDate.text = dateFormatter.string(from: sender.date)
            if self.signView.firstParkingPeriod == nil {
                self.signView.firstParkingPeriod = DayComponents(fromDay: dateComponent, toDay: dateComponent)
            }
            else {
                self.signView.firstParkingPeriod?.fromDay = dateComponent
            }
        case 1:
            self.firstToDate.text = dateFormatter.string(from: sender.date)
            if self.signView.firstParkingPeriod == nil {
                self.signView.firstParkingPeriod = DayComponents(fromDay: dateComponent, toDay: dateComponent)
            }
            else {
                self.signView.firstParkingPeriod?.toDay = dateComponent
            }
        case 2:
            self.secondFromDate.text = dateFormatter.string(from: sender.date)
            if self.signView.secondParkingPeriod == nil {
                self.signView.secondParkingPeriod = DayComponents(fromDay: dateComponent, toDay: dateComponent)
            }
            else {
                self.signView.secondParkingPeriod?.fromDay = dateComponent
            }
        case 3:
            self.secondToDate.text = dateFormatter.string(from: sender.date)
            if self.signView.secondParkingPeriod == nil {
                self.signView.secondParkingPeriod = DayComponents(fromDay: dateComponent, toDay: dateComponent)
            }
            else {
                self.signView.secondParkingPeriod?.toDay = dateComponent
            }
        default:
            self.secondToDate.text = dateFormatter.string(from: sender.date)
        }
    }
    
    @IBAction func unitSwitch(_ sender: Any) {
        let unitSwitch = sender as! UISegmentedControl
        if unitSwitch.selectedSegmentIndex == 0 {
            self.signView.unit = .hour
        }
        else {
            self.signView.unit = .minute
        }
    }
    
    @IBAction func freeSwitch(_ sender: Any) {
        let switchControl = sender as! UISwitch
        self.signView.isFree = !switchControl.isOn
    }
    
    @IBAction func width(_ sender: UISlider) {
        self.signView.frame = CGRect(origin: self.signView.frame.origin,
                                     size: CGSize(width: CGFloat(sender.value), height: self.signView.frame.height))
    }
    @IBAction func height(_ sender: UISlider) {
        self.signView.frame = CGRect(origin: self.signView.frame.origin,
                                     size: CGSize(width: self.signView.frame.width, height: CGFloat(sender.value)))
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

