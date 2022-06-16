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
            return """
                {\"results\":[{\"name\":\"Swift Developer\",\"contents\":\
                "Develop mobile apps.\",\"company\":\"Hatch Software.\",\"id\":9174504,\
                "publication_date\":\"2022-06-01T04:21:33Z\"}]}
                """
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
