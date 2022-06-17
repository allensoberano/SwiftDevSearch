//
//  MuseJobTarget.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/12/22.
//

import Foundation
import Moya

enum MuseJobTarget {
    case engineeringJobs
}

extension MuseJobTarget: TargetType {
    var baseURL: URL {
        return URL(string: Secrets.Muse.apiUrl)!
    }

    var path: String {
        switch self {
        case .engineeringJobs:
            return "/api/public/jobs"
        }
    }

    var method: Moya.Method {
        switch self {
        case .engineeringJobs:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .engineeringJobs:
            return .requestParameters(
                parameters: [
                    "category": "Software Engineer",
                    "page": 1,
                    "api_key": Secrets.Muse.apiKey
                ], encoding: URLEncoding.default)
        }
    }

    var sampleData: Data {
        switch self {
        case .engineeringJobs:
            return "{\"results\":[{\"contents\": \"Dev Apps\", \"name\": \"Swift Dev\", \"publication_date\": \"2021-07-17T10:12:08Z\",\"id\": 6325023,\"company\": {\"name\": \"Apple\"}}]}" // swiftLint:disable
                .data(using: String.Encoding.utf8)!
        }
    }

    var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }

    public var validationType: ValidationType {
        return .successCodes
    }

}
