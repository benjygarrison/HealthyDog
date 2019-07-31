//
//  ViewController.swift
//  HealthyDog
//
//  Created by Benjamin Garrison on 7/30/19.
//  Copyright © 2019 Benji Garrison. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var dogWeightPicker: UIPickerView!
    
    var dogWeightPickerData1: [String] = [String]()
    var dogWeightPickerData2: [String] = [String]()
    var dogWeightPickerData3: [String] = [String]()
    var dogWeightPickerData4: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
        self.dogWeightPicker.delegate = self
        self.dogWeightPicker.dataSource = self
        
        let component1Array = Array(1...100)
        dogWeightPickerData1 = component1Array.map { String($0) }
        dogWeightPickerData2 = ["point"]
        let component3Array = Array(0...10)
        dogWeightPickerData3 = component3Array.map { String($0) }
        dogWeightPickerData4 = ["lbs", "kg"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 4
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return dogWeightPickerData1.count
        }
        if component == 1 {
            return dogWeightPickerData2.count
        }
        if component == 2 {
            return dogWeightPickerData3.count
        }
        return dogWeightPickerData4.count
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return dogWeightPickerData1[row]
        }
        if component == 1  {
            return dogWeightPickerData2[row]
        }
        if component == 2 {
            return dogWeightPickerData3[row]
        }
        return dogWeightPickerData4[row]
    }
    
    //func pickerView( _ pickerView: UIPickerView, //didSelectRow row: Int, inComponent component: //Int) {
    //}
}

