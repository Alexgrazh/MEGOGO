

import Foundation
struct GenresResults : Codable {
	let genres : [Genres]?

	enum CodingKeys: String, CodingKey {

		case genres = "genres"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		genres = try values.decodeIfPresent([Genres].self, forKey: .genres)
	}

}
