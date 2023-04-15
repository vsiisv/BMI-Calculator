//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by VASILY IKONNIKOV on 15.04.2023.
//

import UIKit

struct CalculatorBrain {
	
	var bmi: BMI?
	
	mutating func calculateBMI(height: Float, weight: Float) {
		let bmiValue = weight / pow(height, 2) // (height * height)
		switch bmiValue {
		case ..<18.5:
			bmi = BMI(value: bmiValue, advice: "Underweight", color: .blue)
		case ..<24.9:
			bmi = BMI(value: bmiValue, advice: "Normal", color: .green)
		case 24.9...: 
			bmi = BMI(value: bmiValue, advice: "Overweight", color: .red)
		default:
			break
		}
		
	}
	
	func getBMIValue() -> String {
		//guard let bmiValue else { return "Incorrect value" }
		return String(format: "%.2f", bmi?.value ?? 0.0)
	}
	
	func getAdvice() -> String{
		bmi?.advice ?? "Ooops"
	}
	
	func getColor() -> UIColor {
		bmi?.color ?? .brown
	}
}
