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
    
    func fetchApps(searchTerm : String, completion : @escaping (SearchResult?, Error?) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        
        // fetch Data from Internet
        
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchGames(completion : @escaping (AppGroup?, Error?) -> ()) {
        
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-apps-we-love/all/50/explicit.json"
        fetchAppGroup(urlString: urlString, completion: completion)
        
       
    }
    
    func fetchTopGrossing(completion : @escaping (AppGroup?, Error?) -> ()) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-grossing/all/50/explicit.json"
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    
    
    // helper
    
    func fetchAppGroup(urlString : String, completion: @escaping (AppGroup?,Error?) -> Void) {
      fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchSocialApps(completion : @escaping ([SocialApp]?,Error?) -> Void) {
        let urlString = "http://api.letsbuildthatapp.com/appstore/social"
        
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    // generic json
    
    func fetchGenericJSONData<T : Decodable>(urlString : String, completion : @escaping (T?, Error?) -> ()) {
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(nil,error)
                return
            }
            do {
                let objects = try JSONDecoder().decode(T.self, from: data!)
                //                appGroup.feed.results.forEach({print($0.artistName)})
                completion(objects,nil)
            }catch{
                completion(nil,error)
            }
            }.resume()
    }
}
