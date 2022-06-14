//
//  JobResponse.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/14/22.
//

struct JobResponse: Codable {
    let page, pageCount, itemsPerPage, took: Int
        let timedOut: Bool
        let total: Int
        let results: [Job]

        enum CodingKeys: String, CodingKey {
            case page
            case pageCount = "page_count"
            case itemsPerPage = "items_per_page"
            case took
            case timedOut = "timed_out"
            case total, results
        }
}
