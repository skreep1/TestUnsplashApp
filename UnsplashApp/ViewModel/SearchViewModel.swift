//
//  SearchViewModel.swift
//  UnsplashApp
//
//  Created by Maksim Skrypka on 04.11.2022.
//

import Foundation

class SearchViewModel {
    var resultSearch: [Photo] = []
    private let key = "BJonXMr1gOp83I7Nr49bFtNHaaS4C9TzNJ9F0xUb2yQ"

    // MARK: func search fetchPhoto
    func fetchSearchPhoto(searchTerm: String, completion: @escaping (Result<[Photo], Error>) -> Void) {
        let url = URL(string: "https://api.unsplash.com/search/photos/?client_id=\(key)&query=\(searchTerm)")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if let data = data {
                do {
                    let image = try JSONDecoder().decode(SearchPhoto.self, from: data)
                    completion(.success(image.results))
                    print("\(image)")
                } catch let error {
                    completion(.failure(error))
                    print(String(describing: error)) 
                }
            }
        }.resume()
    }
    
    
}
