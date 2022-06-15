//
//  ListenPodcastsTarget.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/15/22.
//

import Foundation
import Moya

enum ListenPodcastsTarget {
    case podcasts
}

extension ListenPodcastsTarget: TargetType {
    var baseURL: URL {
        return URL(string: Secrets.ListenPodcasts.apiUrl)!
    }

    var path: String {
        switch self {
        case .podcasts:
            return "/api/v2/search"
        }
    }

    var method: Moya.Method {
        switch self {
        case .podcasts:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .podcasts:
            return .requestParameters(
                parameters: [
                    "q": "swift development",
                    "page": 1
                ], encoding: URLEncoding.default)
        }
    }

    var headers: [String: String]? {
        ["Content-Type": "application/json", "X-ListenAPI-Key": Secrets.ListenPodcasts.apiKey]
    }

    public var validationType: ValidationType {
        return .successCodes
    }

}
