//
//  Player.swift
//  Statcenter
//
//  Created by Zachary Frew on 7/19/18.
//  Copyright © 2018 Zachary Frew. All rights reserved.
//

import Foundation

struct Player {
    
    // MARK: - Properties
    let name: String
    let team: String
    let rookieYear: Int
    let yearsInLeague: Int
    
    // MARK: - Initializers
    init?(playersArray: [[String : Any]]?) {
        guard let resultsDictionary = playersArray?[0],
            let name = resultsDictionary[CodingKeys.name.rawValue] as? String,
            let team = resultsDictionary[CodingKeys.team.rawValue] as? String,
            let rookieYear = resultsDictionary[CodingKeys.rookieYear.rawValue] as? Int
            else { return nil }
        
        self.name = name
        self.rookieYear = rookieYear
        self.team = team
       self.yearsInLeague = Calendar.current.component(.year, from: Date()) - rookieYear
    }

    // MARK: - Coding Keys
    enum CodingKeys: String, CodingKey {
        case name = "fullName"
        case team
        case rookieYear
    }
    
}


