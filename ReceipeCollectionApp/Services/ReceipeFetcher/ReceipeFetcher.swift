//
//  ReceipeFetcher.swift
//  ReceipeCollectionApp
//
//  Created by Yuliya Lapenak on 10/4/23.
//

import Foundation

protocol ReceipeFetching {
    func fetchReceipes() -> [ReceipeModel]
}

struct ReceipeFetcher: ReceipeFetching {

	private let fileService: FileReaderServicing

	init(fileService: FileReaderServicing = FileReaderService()) {
		self.fileService = fileService
	}

	func fetchReceipes() -> [ReceipeModel] {
		fileService.fetchReceipes()
	}
}
