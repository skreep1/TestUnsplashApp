//
//  SearchPhoto.swift
//  UnsplashApp
//
//  Created by Maksim Skrypka on 04.11.2022.
//

import Foundation

struct Results: Codable {
    let id: String
}

struct Result: Codable {
    let total: Int
    let total_pages: Int
    let results: [Results]
}
