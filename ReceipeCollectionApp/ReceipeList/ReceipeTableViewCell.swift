//
//  ReceipeTableViewCell.swift
//  ReceipeCollectionApp
//
//  Created by Yuliya Lapenak on 10/4/23.
//

import UIKit

class ReceipeTableViewCell: UITableViewCell {
    
    static let identifier = "ReceipeTableViewCell"
    
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
		label.numberOfLines = 2
		label.font = .systemFont(ofSize: 14, weight: .regular)
		label.textColor = .darkGray
		return label
	}()
    
    let foodImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
		image.layer.masksToBounds = true
		image.layer.cornerRadius = 12
        return image
    }()

	let shadowBackground: UIView = {
		let view = ShadowView()
		view.translatesAutoresizingMaskIntoConstraints = false
		view.backgroundColor = .white
		return view
	}()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
		contentView.backgroundColor = .white
		contentView.addSubview(shadowBackground)
		contentView.addSubview(foodImageView)
		contentView.addSubview(titleLabel)
		contentView.addSubview(descriptionLabel)
		NSLayoutConstraint.activate([
			shadowBackground.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
			shadowBackground.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
			shadowBackground.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
			shadowBackground.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
			
			foodImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
			foodImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
			foodImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
			foodImageView.heightAnchor.constraint(equalToConstant: 60),
			foodImageView.widthAnchor.constraint(equalToConstant: 60),
			
			titleLabel.leadingAnchor.constraint(equalTo: foodImageView.trailingAnchor, constant: 16),
			titleLabel.topAnchor.constraint(equalTo: foodImageView.topAnchor, constant: 0),
			titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
			
			descriptionLabel.leadingAnchor.constraint(equalTo: foodImageView.trailingAnchor, constant: 16),
			descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
			descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
		])
    }
    
    func set(model: ReceipeModel) {
		titleLabel.text = model.name
		descriptionLabel.text = model.description
		foodImageView.image = UIImage(named: model.imageName)
    }

}


class ShadowView: UIView {
	override var bounds: CGRect {
		didSet {
			setupShadow()
		}
	}

	private func setupShadow() {
		self.layer.cornerRadius = 16
		self.layer.shadowOffset = CGSize(width: 0, height: 3)
		self.layer.shadowRadius = 3
		self.layer.shadowOpacity = 0.3
		self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: .allCorners, cornerRadii: CGSize(width: 8, height: 8)).cgPath
		self.layer.shouldRasterize = true
		self.layer.rasterizationScale = UIScreen.main.scale
	}
}
