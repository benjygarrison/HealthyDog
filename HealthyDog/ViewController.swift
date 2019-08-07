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
    //var selectedDogWeight: [String] = [" "]
    var dogWeightFloat: Float = 0.0
    var caloriesNeeded: Float = 1.0
    var calorieEquation: Float = 0.0
    
    @IBOutlet weak var calculateButton: UIButton!
    
    @IBOutlet weak var weightTypeSelector: UISegmentedControl!
    
    @IBOutlet weak var caloriesLabel: UILabel!
    
    
    
    //On load
    
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

        caloriesNeeded = 1
        
        return dogWeightPickerData1[row]
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        dogWeightFloat = Float(dogWeightPickerData1[row])!

        caloriesNeeded = dogWeightFloat
        
    }
    
    
    @IBAction func weightTypeSelected(_ sender: Any) {
        
        if weightTypeSelector.selectedSegmentIndex == 0 {
            calorieEquation = caloriesNeeded / 2.2 * 30 + 70
        }
        if weightTypeSelector.selectedSegmentIndex == 1 {
            calorieEquation = caloriesNeeded * 30 + 70
        }
    }
    
    
    @IBAction func calculateButtonClicked(_ sender: Any) {
        
        
        if weightTypeSelector.selectedSegmentIndex == -1 {
                caloriesLabel.text = "Please select either lbs or kg."
            caloriesLabel.sizeToFit()
        }
        else {
            print((calorieEquation).rounded())
            caloriesLabel.text = "Your dog needs "  + calorieEquation.rounded().description + " calories per day!";
            caloriesLabel.sizeToFit();
            dogWeightPicker.selectRow(0, inComponent: 0, animated: true);
            dogWeightPicker.reloadAllComponents();
            weightTypeSelector.selectedSegmentIndex = -1;
        }
    }
    
}

