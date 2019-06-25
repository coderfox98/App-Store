//
//  SearchResult.swift
//  AppStore
//
//  Created by Rishabh Raj on 24/06/19.
//  Copyright © 2019 Rishabh Raj. All rights reserved.
//

import Foundation

struct SearchResult : Decodable {
    let resultCount : Int
    let results : [Result]
}

struct Result : Decodable {
    let trackName : String
    let primaryGenreName : String
    var averageUserRating : Float?
    let artworkUrl100 : String
    let screenshotUrls : [String]
}
