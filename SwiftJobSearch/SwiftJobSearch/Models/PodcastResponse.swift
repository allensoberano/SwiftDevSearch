//
//  PodcastResponse.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/15/22.
//

struct PodcastResponse: Codable {
    let count, nextOffset, total: Int
    let took: Double
    let results: [Podcast]

    enum CodingKeys: String, CodingKey {
        case count
                case nextOffset = "next_offset"
                case total, took, results
    }
}
