

import Foundation
struct decodeFilms: Codable {
    let count: Int
    let results: [Result]
}

// MARK: - Result
struct Result : Codable {
    let title : String
    let episode_id: Int
    let url: String
}
