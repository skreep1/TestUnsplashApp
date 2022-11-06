//
//  Search.swift
//  UnsplashApp
//
//  Created by Maksim Skrypka on 04.11.2022.
//

import Foundation


struct SearchPhoto: Codable {
    let total: Int
    let total_pages: Int
    let results: [Photo]
}
