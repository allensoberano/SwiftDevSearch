//
//  Job.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/12/22.
//

import Foundation

struct Job: Codable {

    let company: Company
    let description: String
    let jobTitle: String
    let id: Int
    let postDate: String

    enum CodingKeys: String, CodingKey {
        case company = "company"
        case description = "contents"
        case jobTitle = "name"
        case id = "id"
        case postDate = "publication_date"
    }
}

struct Company: Codable {
    let companyName: String

    enum CodingKeys: String, CodingKey {
        case companyName = "name"
    }
}

extension Job: Equatable {
    static func == (lhs: Job, rhs: Job) -> Bool {
        return
            lhs.company.companyName == rhs.company.companyName &&
            lhs.description == rhs.description &&
            lhs.jobTitle == rhs.jobTitle &&
            lhs.id == rhs.id &&
            lhs.postDate == rhs.postDate
    }
}
