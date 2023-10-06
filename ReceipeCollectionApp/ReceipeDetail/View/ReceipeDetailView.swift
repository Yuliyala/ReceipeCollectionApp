//
//  ReceipeDetailView.swift
//  ReceipeCollectionApp
//
//  Created by Yuliya Lapenak on 10/4/23.
//

import UIKit

class ReceipeDetailView: UIView {

	private let scrollView: UIScrollView = {
		let scrollView = UIScrollView()
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		scrollView.showsVerticalScrollIndicator = false
		return scrollView
	}()

	private let contentStackView: UIStackView = {
		let stackView = UIStackView()
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.alignment = .fill
		stackView.distribution = .fill
		stackView.axis = .vertical
		stackView.spacing = 0
		return stackView
	}()

	private let headerView: ReceipeDetailsHeaderView = {
		let view = ReceipeDetailsHeaderView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	private let ingredientsTableView: UITableView = {
		let table = UITableView()
		table.register(IngredientCell.self, forCellReuseIdentifier: IngredientCell.identifier)
		table.alwaysBounceVertical = false
		table.translatesAutoresizingMaskIntoConstraints = false
		return table
	}()

	private let instructionsView: InstructionsListView = {
		let view = InstructionsListView()
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	private var tableViewHeightConstraint: NSLayoutConstraint?
	private var ingredients: [Ingredient] = []

    override init(frame: CGRect) {
        super.init(frame: frame)
		setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	func setup() {
		backgroundColor = .white
		addSubview(scrollView)
		scrollView.addSubview(contentStackView)
		contentStackView.addArrangedSubview(headerView)
		contentStackView.addArrangedSubview(ingredientsTableView)
		contentStackView.addArrangedSubview(instructionsView)
		
		NSLayoutConstraint.activate([
			scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
			scrollView.leftAnchor.constraint(equalTo: leftAnchor),
			scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
			scrollView.rightAnchor.constraint(equalTo: rightAnchor),
			
			contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
			contentStackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
			contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
			contentStackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
			contentStackView.widthAnchor.constraint(equalTo: widthAnchor)
		])

		tableViewHeightConstraint = ingredientsTableView.heightAnchor.constraint(equalToConstant: 0)
		tableViewHeightConstraint?.isActive = true
		ingredientsTableView.delegate = self
		ingredientsTableView.dataSource = self
	}

	func set(model: ReceipeModel) {
		headerView.set(model: model)
		instructionsView.set(instructions: model.instructions)
		ingredients = model.ingredients
		ingredientsTableView.reloadData()
		tableViewHeightConstraint?.constant = CGFloat((ingredients.count + 1) * 40) + 20
		ingredientsTableView.layoutIfNeeded()
	}
}

extension ReceipeDetailView: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		ingredients.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: IngredientCell.identifier, for: indexPath) as? IngredientCell else {
			return UITableViewCell()
		}
		
		cell.set(model: ingredients[indexPath.row])
		
		return cell
	}

	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return "Ingredients"
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		40
	}

	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		30
	}
}
