//
//  ReceipeDetailViewController.swift
//  ReceipeCollectionApp
//
//  Created by Yuliya Lapenak on 10/4/23.
//

import UIKit

class ReceipeDetailViewController: UIViewController {
     
    var recipe: ReceipeModel
    
    var rootView: ReceipeDetailView {
        view as! ReceipeDetailView
    }

	init(recipe: ReceipeModel) {
		self.recipe = recipe
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
    
    override func loadView() {
        self.view = ReceipeDetailView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
		rootView.set(model: recipe)
    }
    
}

