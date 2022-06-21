//
//  Unsplash.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/20/22.
//

import Foundation

struct UnsplashImage: Codable {
    let id: String
    let createdAt, updatedAt: Date
    let width, height: Int
    let urls: Urls

    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case width, height
        case urls
    }
}

// MARK: - Urls
struct Urls: Codable {
    let regular, small: String
    let thumb, smallS3: String

    enum CodingKeys: String, CodingKey {
        case regular, small, thumb
        case smallS3 = "small_s3"
    }
}
