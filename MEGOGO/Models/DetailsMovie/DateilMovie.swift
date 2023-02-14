//
//  DateilMovie.swift
//  MEGOGO
//
//  Created by Alex Grazhdan on 13.02.2023.
//

import Foundation

struct DateilMovie : Codable {
    let results : [ResultsDetail]?
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        results = try values.decodeIfPresent([ResultsDetail].self, forKey: .results)
    }
}



