//
//  SearchViewModel.swift
//  UnsplashApp
//
//  Created by Maksim Skrypka on 04.11.2022.
//

import Foundation


class SearchViewModel {
    //        let url = URL(string: "https://api.unsplash.com/photos//search/photos/?query=&client_id=\(key)")
    var resultSearch: [Photo] = []
    private let key = "BJonXMr1gOp83I7Nr49bFtNHaaS4C9TzNJ9F0xUb2yQ"

    // MARK: func fetchPhoto
    func fetchPhoto(searchTerm: String, completion: @escaping (Result<[Photo], Error>) -> Void) {
        let url = URL(string: "https://api.unsplash.com/search/photos/?client_id=\(key)&query=\(searchTerm)")
//        var request = URLRequest(url: url!)
//        request.httpMethod = "GET"
//        request.setValue("Client-ID \(key)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            
            if let data = data {
                do {
                    let image = try JSONDecoder().decode(SearchPhoto.self, from: data)
                    //self.resultSearch.append(image)
                    completion(.success(image.results))
                    //self.resultSearch = image.results
                    print("\(image)")
                } catch let error {
                    completion(.failure(error))
                    print(String(describing: error)) 
                }
            }
        }.resume()
    }
    
    
}
