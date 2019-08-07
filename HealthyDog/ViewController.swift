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
    var dogWeightFloat: Float?
    var caloriesNeeded: Float?
    var calorieEquation: Float?
    
    @IBOutlet weak var calculateButton: UIButton!
    
    @IBOutlet weak var weightTypeSelector: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        
        self.dogWeightPicker.delegate = self
        self.dogWeightPicker.dataSource = self
        
        
        let component1Array = Array(1...100)
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
        
        dogWeightFloat = Float(dogWeightPickerData1[row])
        //selectedDogWeight = [dogWeightPickerData1[row]]
        
        caloriesNeeded = dogWeightFloat!

    }
    
    
    @IBAction func weightTypeSelected(_ sender: Any) {
        
        if weightTypeSelector.selectedSegmentIndex == 0 {
            calorieEquation = caloriesNeeded! * 30 + 70
        }
        if weightTypeSelector.selectedSegmentIndex == 1 {
            calorieEquation = caloriesNeeded! / 2.2 * 30 + 70
        }
    }
    
    
    @IBAction func calculateButtonClicked(_ sender: Any) {
        
        if calorieEquation == nil {
            print("please select either lbs or kg")
        }
        if weightTypeSelector.selectedSegmentIndex == -1 {
                print("please select either lbs or kg")
        }
        else {
            print((calorieEquation!).rounded())
            dogWeightPicker.selectRow(0, inComponent: 0, animated: true);
            dogWeightPicker.reloadAllComponents();
            weightTypeSelector.selectedSegmentIndex = -1;
        }
    }
    
}

