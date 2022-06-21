//
//  UnsplashImageTarget.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/20/22.
//

import Foundation
import Moya

enum UnsplashImageTarget {
    case remoteWorkImages
}

extension UnsplashImageTarget: TargetType {
    var baseURL: URL {
        return URL(string: Secrets.Unsplash.apiUrl)!
    }

    var path: String {
        switch self {
        case .remoteWorkImages:
            return "/search/photos/"
        }
    }

    var method: Moya.Method {
        switch self {
        case .remoteWorkImages:
            return .get
        }
    }

    var sampleData: Data {
        switch self {
        case .remoteWorkImages:
            return "{\"results\":[{\"id\": \"abc123\", \"created_at\": \"2017-07-12T22:55:49-04:00\", \"updated_at\": \"2022-06-20T08:01:38-04:00\",\"width\": 6000,\"height\": 4000,\"urls\": {\"regular\": \"https://images.unsplash.com/photo\"},\"small\": \"https://images.unsplash.com/photosmall\",\"thumb\": \"https://images.unsplash.com/photothumb\"},}]}".data(using: String.Encoding.utf8)! // swiftLint:disable
        }
    }

    var task: Task {
        switch self {
        case .remoteWorkImages:
            return .requestParameters(
                parameters: [
                    "client_id": Secrets.Unsplash.accessKey,
                    "query": "travel-remote-work"
                ],
                encoding: URLEncoding.default)
        }
    }

    var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }

    public var validationType: ValidationType {
        return .successCodes
    }
}
