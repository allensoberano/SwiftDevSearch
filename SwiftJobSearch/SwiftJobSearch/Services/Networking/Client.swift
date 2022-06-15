//
//  Client.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/14/22.
//

import Foundation
import Moya

final class Client {

    // MARK: MuseJob
    private lazy var middlewareMuseJobProvider: MoyaProvider<MuseJobTarget> = {
        var plugins = verbosePlugin()

        return MoyaProvider<MuseJobTarget>(plugins: plugins)
    }()

    func requestMuseJobs<T: Decodable>(target: MuseJobTarget, completion: @escaping (Result<T, Error>) -> Void) {
        middlewareMuseJobProvider.request(.engineeringJobs) { result in
            switch result {
            case .success(let response):
                do {
                    if let results = try? JSONDecoder().decode(T.self, from: response.data) {
                        completion(.success(results))
                    }
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

    private lazy var middlewareListenPodcastsProvider: MoyaProvider<ListenPodcastsTarget> = {
        var plugins = verbosePlugin()

        return MoyaProvider<ListenPodcastsTarget>(plugins: plugins)
    }()

    func requestPodcasts<T: Decodable>(target: ListenPodcastsTarget, completion: @escaping (Result<T, Error>) -> Void) {
        middlewareListenPodcastsProvider.request(.podcasts) { result in
            switch result {
            case .success(let response):
                do {
                    if let results = try? JSONDecoder().decode(T.self, from: response.data) {
                        completion(.success(results))
                    }
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

}

extension Client {

    private func verbosePlugin() -> [PluginType] {
        var plugins: [PluginType] = []

        #if DEBUG
        plugins.append(
            NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose))
        )
        #endif

        return plugins
    }
}
