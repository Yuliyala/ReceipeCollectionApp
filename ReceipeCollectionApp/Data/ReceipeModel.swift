//
//  ReceipeModel.swift
//  ReceipeCollectionApp
//
//  Created by Yuliya Lapenak on 10/4/23.
//

import Foundation

struct ReceipeModel: Decodable {
    let id: Int
    let name: String
    let description: String
    let ingredients: [Ingredient]
    let instructions: [String]

	var imageName: String {
		String(id)
	}

	var instructionsList: NSAttributedString {
		var string = NSAttributedString()
		return string
	}
}

struct Ingredient: Decodable {
    let name: String
    let amount: Double
    let unit: String
}
