//
//  IngredientCell.swift
//  ReceipeCollectionApp
//
//  Created by Yuliya Lapenak on 10/4/23.
//

import UIKit

class IngredientCell: UITableViewCell {
	
	static let identifier = "IngredientCell"
	
	let titleLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .left
		label.numberOfLines = 1
		label.font = .systemFont(ofSize: 16, weight: .semibold)
		label.textColor = .black
		return label
	}()

	let descriptionLabel: UILabel = {
		let label = UILabel()
		label.translatesAutoresizingMaskIntoConstraints = false
		label.textAlignment = .right
		label.numberOfLines = 1
		label.font = .systemFont(ofSize: 16, weight: .regular)
		label.textColor = .darkGray
		return label
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setup()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func setup() {
		contentView.addSubview(titleLabel)
		contentView.addSubview(descriptionLabel)
		NSLayoutConstraint.activate([
			
			titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
			titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			
			descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8),
			descriptionLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
		])
	}
	
	func set(model: Ingredient) {
		titleLabel.text = model.name
		descriptionLabel.text = String(model.amount) + "/" + model.unit
	}

}
