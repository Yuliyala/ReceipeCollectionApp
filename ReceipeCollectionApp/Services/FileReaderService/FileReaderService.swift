//
//  FileReaderService.swift
//  ReceipeCollectionApp
//
//  Created by Yuliya Lapenak on 10/4/23.
//

import Foundation

protocol FileReaderServicing {
	func fetchReceipes() -> [ReceipeModel]
}

struct FileReaderService: FileReaderServicing {
    
    enum File {
        case receipes
        
        var fileName: String {
            switch self {
            case .receipes:
                return "receipes"
            }
        }
        
    }
    
    func getDataFromJSONFile(forName name: String) -> Data? {
        
        if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
           let jsonData = try? String(contentsOfFile: bundlePath).data(using: .utf8) {
            return jsonData
        }
        return nil
    }
    
    func fetchReceipes() -> [ReceipeModel] {
        if let data = getDataFromJSONFile(forName: File.receipes.fileName) {
            let array = try? JSONDecoder().decode([ReceipeModel].self, from: data)
            return array ?? []
        }
        return []
    }
}
