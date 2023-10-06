//
//  InstructionExpandableView.swift
//  ReceipeCollectionApp
//
//  Created by Yuliya Lapenak on 10/4/23.
//

import UIKit

class InstructionExpandableView: UIView {

	let titleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .left
		label.numberOfLines = 1
		label.font = .systemFont(ofSize: 18, weight: .semibold)
		label.textColor = .black
		return label
	}()

	let descriptionLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .left
		label.numberOfLines = 1
		label.font = .systemFont(ofSize: 16, weight: .regular)
		label.textColor = .darkGray
		return label
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
		addSubview(descriptionLabel)
		addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapHandler)))
		NSLayoutConstraint.activate([
			
			titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
			titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
			
			descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
			descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
			descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
		])
	}

	@objc private func tapHandler() {
		descriptionLabel.numberOfLines = descriptionLabel.numberOfLines == 0 ? 1 : 0
	}

	func set(instruction: String, step: Int) {
		descriptionLabel.text = instruction
		titleLabel.text = "Step \(step)"
	}
}
