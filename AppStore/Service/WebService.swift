//
//  WebService.swift
//  AppStore
//
//  Created by Rishabh Raj on 24/06/19.
//  Copyright © 2019 Rishabh Raj. All rights reserved.
//

import Foundation

class WebService {
    
    static let shared = WebService() // singleton
    
    func fetchApps(searchTerm : String, completion : @escaping ([Result], Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        guard let url = URL(string: urlString) else { return }
        
        // fetch Data from Internet
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Failed to fetch data",error.localizedDescription)
                completion([],nil)
                return
            }
            
            // success
            guard let data = data else { return }
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                //                searchResult.results.forEach({print($0.trackName, $0.primaryGenreName)})
                completion(searchResult.results, nil)
            }catch let jsonError {
                print("Failed to decode JSON",jsonError)
                completion([],jsonError)
            }
            
            
            
            }.resume()

    }
    
}
