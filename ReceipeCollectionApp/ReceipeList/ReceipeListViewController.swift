//
//  ReceipeListViewController.swift
//  ReceipeCollectionApp
//
//  Created by Yuliya Lapenak on 10/4/23.
//

import UIKit

class ReceipeListViewController: UIViewController, UISearchResultsUpdating {
  
	private let receipeFetcher: ReceipeFetching
    var dataSource: [ReceipeModel] = []
    var filteredDataSource: [ReceipeModel] = []
    let searchController = UISearchController()
    
	var rootView: ReceipeListView {
		view as! ReceipeListView
	}
    
    var isSearchTypingInProgress: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    
    var isFiltering: Bool = false

	init(receipeFetcher: ReceipeFetching = ReceipeFetcher()) {
		self.receipeFetcher = receipeFetcher
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func loadView() {
		self.view = ReceipeListView()
	}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        loadData()
        setupSearch()
    }
    
    func setupTable() {
		rootView.tableView.dataSource = self
		rootView.tableView.delegate = self
    }
    
    func loadData() {
		dataSource = receipeFetcher.fetchReceipes()
		rootView.tableView.reloadData()
    }
    
    func setupSearch() {
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        isFiltering = isSearchTypingInProgress
        filterArrayAndUpdateData(searchText: text)
    }
    
    func filterArrayAndUpdateData(searchText: String) {
        if searchController.isActive && !searchBarIsEmpty {
            filteredDataSource = dataSource.filter { $0.name.lowercased().hasPrefix(searchText.lowercased()) }
        }
        rootView.tableView.reloadData()
    }
}

extension ReceipeListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filteredDataSource.count
        }
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ReceipeTableViewCell.identifier, for: indexPath) as? ReceipeTableViewCell else {
            return UITableViewCell()
        }
        var arrayWithData = [ReceipeModel]()
        isFiltering ? (arrayWithData = filteredDataSource) : (arrayWithData = dataSource)
        cell.set(model: arrayWithData[indexPath.row])
        
        return cell
    }
}

extension ReceipeListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 92
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let receipe = isFiltering ? filteredDataSource[indexPath.row] : dataSource[indexPath.row]
        let detailViewController = ReceipeDetailViewController(recipe: receipe)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
