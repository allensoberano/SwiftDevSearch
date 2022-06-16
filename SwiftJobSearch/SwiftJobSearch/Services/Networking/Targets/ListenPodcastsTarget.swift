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

    var sampleData: Data {
        switch self {
        case .podcasts:
            return """
                {\"results\":[{\
                "id\":\"241395da159a4242bbeb8089d320bcf1\",\
                "title_original\":\"The iPhreaks Show\",\
                "description_original\":\"<h2><strong>This Episode is about ...</strong></h2>\",\
                "thumbnail\":\"https://cdn-images-1.listennotes.com/podcasts/the-iphreaks-show-top-end-devs-vG539RB8Nsx-hPrW0zJTlSO.300x300.jpg\",\
                "image"\":\"https://cdn-images-1.listennotes.com/podcasts/the-iphreaks-show-top-end-devs-vG539RB8Nsx-hPrW0zJTlSO.300x300.jpg\",\
                "listennotes_url\":\"https://www.listennotes.com/c/241395da159a4242bbeb8089d320bcf1/\"}]}
                """
                .data(using: String.Encoding.utf8)! // swiftlint:disable
        }
    }
    var headers: [String: String]? {
        ["Content-Type": "application/json", "X-ListenAPI-Key": Secrets.ListenPodcasts.apiKey]
    }

    public var validationType: ValidationType {
        return .successCodes
    }

}
