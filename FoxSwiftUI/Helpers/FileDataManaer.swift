//
//  FileDataManaer.swift
//  FoxSwiftUI
//
//  Created by zengsenyuan on 2022/5/22.
//  


import Foundation

struct FileDataManaer {
    
    static func loadBundledJSON<T: Decodable>(file: String) -> T {
        guard let url = Bundle.main.url(forResource: file, withExtension: "json") else {
            fatalError("Resource not found: \(file)")
        }
        return try! loadJSON(from: url)
    }

    static func loadJSON<T: Decodable>(from url: URL) throws -> T {
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
}

