//
//  Podcast.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/15/22.
//

import Foundation

struct Podcast: Codable {
    let id: String
    let image: String
    let thumbnail: String
    let titleOriginal: String
    let descriptionOriginal: String
    let listennotesURL: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case image = "image"
        case thumbnail = "thumbnail"
        case titleOriginal = "title_original"
        case descriptionOriginal = "description_original"
        case listennotesURL = "listennotes_url"
    }
}
