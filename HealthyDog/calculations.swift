//
//  calculations.swift
//  HealthyDog
//
//  Created by Benjamin Garrison on 8/6/19.
//  Copyright © 2019 Benji Garrison. All rights reserved.
//

import UIKit

class Calculations {
    
    func restingEnergyRequirementPounds(weight: Float) -> String {
        var dailyCaloriesPounds = Float()
        
        dailyCaloriesPounds = weight * 30 + 70
        
        let caloriesPounds = String(dailyCaloriesPounds.rounded())
        return caloriesPounds
    }
    
    func restingEnergyRequirementKilos(weight: Float) -> String {
        var dailyCaloriesKilos = Float()
        
        dailyCaloriesKilos = weight / 2.2 * 30 + 70
        
        let caloriesKilos = String(dailyCaloriesKilos.rounded())
        return caloriesKilos
    }
}
