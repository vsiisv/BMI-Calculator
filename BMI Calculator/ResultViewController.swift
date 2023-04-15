//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by VASILY IKONNIKOV on 13.04.2023.
//

import UIKit

class ResultViewController: UIViewController {

	var result: Float?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		view.backgroundColor = UIColor(red: 51/255, green: 123/255, blue: 197/255, alpha: 1)
		addSubviews()
		addConstraints()
		showResult()
    }
	
	
	func showResult() {
		guard let result else { return }
		valueLabel.text = String(format: "%.2f", result)
	}
    
	@objc func recalculate() {
		dismiss(animated: true)
	}
	
	// MARK: - View
	lazy var yourResultLabel = createLabel(title: "YOUR RESULT", fontSize: 35, weight: .bold)
	lazy var valueLabel = createLabel(title: "0.0", fontSize: 80, weight: .bold)
	lazy var recommendationLabel = createLabel(title: "EAT SOME MORE SNACKS!", fontSize: 20, weight: .light)
	
	lazy var resultBackground: UIImageView = {
		let imageView = UIImageView()
		let image = UIImage(named: "result_background")
		imageView.image = image
		imageView.translatesAutoresizingMaskIntoConstraints = false
		return imageView
	}()
	
	lazy var verticalStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.alignment = .fill
		stackView.distribution = .fill
		stackView.spacing = 8
		stackView.contentMode = .scaleToFill
		stackView.translatesAutoresizingMaskIntoConstraints = false
		return stackView
	}()
	
	lazy var recalculateButton: UIButton = {
		let button = UIButton()
		let color = UIColor(red: 116/255, green: 114/255, blue: 210/255, alpha: 1)
		button.setTitleColor(color, for: .normal)
		button.setTitle("RECALCULATE", for: .normal)
		button.backgroundColor = .white
		button.addTarget(
			self,
			action: #selector(recalculate),
			for: .touchUpInside
		)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	func createLabel(title: String, fontSize: CGFloat, weight: UIFont.Weight) -> UILabel {
		let label = UILabel()
		label.text = title
		label.textAlignment = .center
		label.textColor = .white
		label.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
		return label
	}
	
	// MARK: - Constraints
	func setResultBackgroundConstraints() {
		NSLayoutConstraint.activate([
			resultBackground.topAnchor.constraint(equalTo: view.topAnchor),
			resultBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			resultBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			resultBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
	}
	
	func setStackViewConstraints() {
		NSLayoutConstraint.activate([
			verticalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			verticalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
		])
	}
	
	func setRecalculateButtonConstraint() {
		NSLayoutConstraint.activate([
			recalculateButton.heightAnchor.constraint(equalToConstant: 51),
			recalculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			recalculateButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
			recalculateButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
		])
	}
	// MARK: - Add subviews and constraints
	func addSubviews() {
		view.addSubview(resultBackground)
		view.addSubview(verticalStackView)
		verticalStackView.addArrangedSubview(yourResultLabel)
		verticalStackView.addArrangedSubview(valueLabel)
		verticalStackView.addArrangedSubview(recommendationLabel)
		view.addSubview(recalculateButton)
	}
	
	func addConstraints() {
		setResultBackgroundConstraints()
		setStackViewConstraints()
		setRecalculateButtonConstraint()
	}
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
