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

        return MoyaProvider<MuseJobTarget>(plugins: verbosePlugin())
    }()

    private let provider: MoyaProvider<MultiTarget>

        init(provider: MoyaProvider<MultiTarget> = MoyaProvider<MultiTarget>()) {
            self.provider = provider
        }

    func requestMuseJobs<T: Decodable>(completion: @escaping (Result<T, Error>) -> Void) {
        provider.request(MultiTarget(MuseJobTarget.engineeringJobs)) { result in
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

    func requestPodcasts<T: Decodable>(completion: @escaping (Result<T, Error>) -> Void) {
        provider.request(MultiTarget(ListenPodcastsTarget.podcasts)) { result in
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

    func requestImages<T: Decodable>(completion: @escaping (Result<T, Error>) -> Void) {
        provider.request(MultiTarget(UnsplashImageTarget.remoteWorkImages)) { result in
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
