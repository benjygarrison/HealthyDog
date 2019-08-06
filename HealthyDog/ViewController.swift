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
    var selectedDogWeight: [String] = [" "]
    
    @IBOutlet weak var calculateButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
        self.dogWeightPicker.delegate = self
        self.dogWeightPicker.dataSource = self
        
        let component1Array = Array(0...100)
        dogWeightPickerData1 = component1Array.map { String($0) }

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {

        return dogWeightPickerData1.count
    }
    
    func pickerView( _ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        return dogWeightPickerData1[row]
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        selectedDogWeight = [dogWeightPickerData1[row]]
    }
    
    @IBAction func calculateButtonClicked(_ sender: Any) {
        
        print(selectedDogWeight)
    }
    
}

