//
//  ResultsDetail.swift
//  MEGOGO
//
//  Created by Alex Grazhdan on 13.02.2023.
//

import Foundation

struct ResultsDetail : Codable {
    let imdb_id : String?
    let original_language : String?
    let runtime : Int?
    
    
    
    enum CodingKeys: String, CodingKey {
        case imdb_id = "imdb_id"
        case original_language = "original_language"
        case runtime = "runtime"
    }
    
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        imdb_id = try values.decodeIfPresent(String.self, forKey: .imdb_id)
        original_language = try values.decodeIfPresent(String.self, forKey: .original_language)
        runtime = try values.decodeIfPresent(Int.self, forKey: .runtime)
    
    }
}
