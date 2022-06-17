//
//  Podcast.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/15/22.
//

import Foundation

struct Podcast: Codable {
    let descriptionOriginal: String
    let id: String
    let image: String
    let listennotesURL: String
    let thumbnail: String
    let titleOriginal: String

    enum CodingKeys: String, CodingKey {
        case descriptionOriginal = "description_original"
        case id = "id"
        case image = "image"
        case listennotesURL = "listennotes_url"
        case thumbnail = "thumbnail"
        case titleOriginal = "title_original"
    }
}

extension Podcast: Equatable {
    static func == (lhs: Podcast, rhs: Podcast) -> Bool {
        return lhs.descriptionOriginal == rhs.descriptionOriginal &&
        lhs.id == rhs.id &&
        lhs.image == rhs.image &&
        lhs.listennotesURL == rhs.listennotesURL &&
        lhs.thumbnail == rhs.thumbnail &&
        lhs.titleOriginal == rhs.titleOriginal
    }
}
