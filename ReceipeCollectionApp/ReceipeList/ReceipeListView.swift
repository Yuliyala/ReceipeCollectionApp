//
//  ReceipeListView.swift
//  ReceipeCollectionApp
//
//  Created by Yuliya Lapenak on 10/4/23.
//

import UIKit

class ReceipeListView: UIView {

	let tableView: UITableView = {
		let tableView = UITableView(frame: .zero)
		tableView.translatesAutoresizingMaskIntoConstraints = false
		tableView.register(ReceipeTableViewCell.self, forCellReuseIdentifier: ReceipeTableViewCell.identifier)
		tableView.separatorStyle = .none
		return tableView
	}()
    
    init() {
        super.init(frame: .zero)
		setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	func setup() {
		backgroundColor = .white
		addSubview(tableView)
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: topAnchor),
			tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
			tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
		])
	}
}
