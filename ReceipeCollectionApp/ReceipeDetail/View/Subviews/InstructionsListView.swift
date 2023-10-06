//
//  InstructionsListView.swift
//  ReceipeCollectionApp
//
//  Created by Yuliya Lapenak on 10/4/23.
//

import UIKit

class InstructionsListView: UIView {

	let titleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .left
		label.numberOfLines = 1
		label.font = .systemFont(ofSize: 18, weight: .semibold)
		label.textColor = .black
		label.text = "Instructions"
		return label
	}()

	let instructionsStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.alignment = .fill
		stackView.distribution = .fill
		stackView.axis = .vertical
		stackView.spacing = 4
		return stackView
	}()

	init() {
		super.init(frame: .zero)
		setup()
	}

	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setup()
	}

	func setup() {
		addSubview(titleLabel)
		addSubview(instructionsStackView)

		NSLayoutConstraint.activate([
			
			titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
			titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
			
			instructionsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			instructionsStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
			instructionsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
			instructionsStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
		])
	}


	func set(instructions: [String]) {
		for index in instructions.indices {
			let rowView = InstructionExpandableView()
			rowView.set(instruction: instructions[index], step: index + 1)
			instructionsStackView.addArrangedSubview(rowView)
			instructionsStackView.addArrangedSubview(buildSeparator())
		}
	}

	func buildSeparator() -> UIView {
		let view = UIView()
		view.backgroundColor = .darkGray
		view.translatesAutoresizingMaskIntoConstraints = false
		view.heightAnchor.constraint(equalToConstant: 1).isActive = true
		return view
	}
}

