//
//  ReceipeDetailsHeaderView.swift
//  ReceipeCollectionApp
//
//  Created by Yuliya Lapenak on 10/4/23.
//

import UIKit

class ReceipeDetailsHeaderView: UIView {

	let titleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .center
		label.numberOfLines = 2
		label.font = .systemFont(ofSize: 18, weight: .semibold)
		label.textColor = .black
		return label
	}()

	let descriptionLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .left
		label.numberOfLines = 0
		label.font = .systemFont(ofSize: 14, weight: .regular)
		label.textColor = .darkGray
		return label
	}()
	
	let foodImageView: UIImageView = {
		let image = UIImageView()
		image.translatesAutoresizingMaskIntoConstraints = false
		image.contentMode = .scaleAspectFit
		image.layer.masksToBounds = true
		image.layer.cornerRadius = 16
		return image
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
		addSubview(foodImageView)
		addSubview(titleLabel)
		addSubview(descriptionLabel)

		NSLayoutConstraint.activate([
			
			foodImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
			foodImageView.heightAnchor.constraint(equalToConstant: 220),
			foodImageView.widthAnchor.constraint(equalToConstant: 220),
			foodImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
			
			titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			titleLabel.topAnchor.constraint(equalTo: foodImageView.bottomAnchor, constant: 16),
			titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
			
			descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
			descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
			descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
			descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
		])
	}

	func set(model: ReceipeModel) {
		foodImageView.image = UIImage(named: model.imageName)
		titleLabel.text = model.name
		descriptionLabel.text = model.description
	}
}
