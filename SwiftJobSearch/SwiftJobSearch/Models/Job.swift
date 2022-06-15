//
//  Job.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/12/22.
//

import Foundation

struct Job: Codable {
    let description: String
    let jobTitle: String
    let postDate: String
    let id: Int
    let company: Company

    enum CodingKeys: String, CodingKey {
        case description = "contents"
        case jobTitle = "name"
        case postDate = "publication_date"
        case id = "id"
        case company = "company"
    }
}

struct Company: Codable {
    let companyName: String

    enum CodingKeys: String, CodingKey {
        case companyName = "name"
    }
}
