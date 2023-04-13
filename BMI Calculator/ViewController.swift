//
//  ViewController.swift
//  BMI Calculator
//
//  Created by VASILY IKONNIKOV on 12.04.2023.
//

import UIKit

class ViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.addSubview(calculateBackground)
		view.addSubview(verticalStackView)
		verticalStackView.addArrangedSubview(calculateLabel)
		verticalStackView.addArrangedSubview(horizontalStack1)
		verticalStackView.addArrangedSubview(heightSlider)
		verticalStackView.addArrangedSubview(horizontalStack2)
		verticalStackView.addArrangedSubview(widthSlider)
		horizontalStack1.addArrangedSubview(heightLabel)
		horizontalStack1.addArrangedSubview(meterLabel)
		horizontalStack2.addArrangedSubview(weightLabel)
		horizontalStack2.addArrangedSubview(kiloLabel)
		verticalStackView.addArrangedSubview(calculateButton)
		
		setBackgroundImageConstraints()
		setStackViewConstraints()
		setConstraints()
		setButtonConstraint()
	}

	// MARK: - View
	lazy var horizontalStack1 = createHorizontalStackView()
	lazy var horizontalStack2 = createHorizontalStackView()
	
	lazy var calculateLabel = createLabel(title: "CALCULATE YOUR BMI", fontSize: 40, weight: .bold, numberOfLines: 0)
	lazy var heightLabel = createLabel(title: "Height", fontSize: 17, weight: .light)
	lazy var meterLabel = createLabel(title: "1.5m", fontSize: 17, weight: .light)
	lazy var weightLabel = createLabel(title: "Height", fontSize: 17, weight: .light)
	lazy var kiloLabel = createLabel(title: "100Kg", fontSize: 17, weight: .light)
	
	lazy var heightSlider = createSlider(value: 1.5, minimum: 0, maximum: 3)
	lazy var widthSlider = createSlider(value: 100, minimum: 0, maximum: 200)
	
	lazy var calculateBackground: UIImageView = {
		let imageView = UIImageView()
		let image = UIImage(named: "calculate_background")
		imageView.image = image
		return imageView
	}()
	
	lazy var verticalStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.alignment = .fill
		stackView.distribution = .fillProportionally
		stackView.spacing = 10
		stackView.contentMode = .scaleToFill
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()
	
	func createSlider(value: Float, minimum: Float, maximum: Float) -> UISlider {
		let color = UIColor(red: 116/255, green: 114/255, blue: 210/255, alpha: 0.5)
		let slider = UISlider()
		slider.value = value
		slider.minimumValue = minimum
		slider.maximumValue = maximum
		slider.minimumTrackTintColor = color
		slider.thumbTintColor = color
		return slider
	}
	
	lazy var calculateButton: UIButton = {
		let button = UIButton()
		button.setTitle("CALCULATE", for: .normal)
		button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
		button.backgroundColor = UIColor(red: 98/255, green: 96/255, blue: 157/255, alpha: 1)
		return button
	}()
	
	func createHorizontalStackView() -> UIStackView {
		let stackView = UIStackView()
		stackView.axis = .horizontal
		stackView.alignment = .fill
		stackView.distribution = .equalSpacing
		stackView.spacing = 0
		stackView.contentMode = .scaleToFill
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}
	
	func createLabel(title: String, fontSize: CGFloat, weight: UIFont.Weight, numberOfLines: Int = 1) -> UILabel {
		let label = UILabel()
		label.numberOfLines = numberOfLines
		label.text = title
		label.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
		label.textColor = .darkGray
		return label
	}
	
	
	// MARK: - Constraints
	func setBackgroundImageConstraints() {
		calculateBackground.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			calculateBackground.topAnchor.constraint(equalTo: view.topAnchor),
			calculateBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			calculateBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			calculateBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}
	
	func setStackViewConstraints() {
		NSLayoutConstraint.activate([
			verticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			verticalStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
			verticalStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
			verticalStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		])
	}
	
	func setConstraints() {
		NSLayoutConstraint.activate([
			horizontalStack1.heightAnchor.constraint(equalToConstant: 21),
			heightSlider.heightAnchor.constraint(equalToConstant: 60),
			horizontalStack2.heightAnchor.constraint(equalToConstant: 21),
			widthSlider.heightAnchor.constraint(equalToConstant: 60)
		])
	}
	
	func setButtonConstraint() {
		NSLayoutConstraint.activate([
			calculateButton.heightAnchor.constraint(equalToConstant: 51)
		])
	}

}

