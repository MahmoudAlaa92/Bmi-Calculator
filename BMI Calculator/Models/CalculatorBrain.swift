//
//  BMI.swift
//  BMI Calculator
//
//  Created by mahmoud on 26/07/2023.
//

import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    func getBMIValue () -> String{
        
        return String(format: "%0.1f",bmi?.value ?? 0.0)
    }
    
    mutating func calculateBMI(hight: Float,weight: Float){
        let bmiValue = Float(weight) / powf(hight, 2)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more pies", color: UIColor(named: "more-pies")!)
        }else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as fiddle", color: UIColor(named: "Fit")!)
        }else{
            bmi = BMI(value: bmiValue, advice: "Eat less pies", color: UIColor(named: "less-pies")!)
        }
    }
    
    func getAdvice ()->String {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor ()-> UIColor {
        return bmi?.color ?? UIColor.white
    }
}
