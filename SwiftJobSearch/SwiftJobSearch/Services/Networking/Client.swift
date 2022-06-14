//
//  Client.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/13/22.
//

import Foundation
import Moya

final class Client {
    
    private lazy var middlewareMuseJobProvider: MoyaProvider<MuseJobTarget> = {
        var plugins: [PluginType] = []

        #if DEBUG
        plugins.append(
            NetworkLoggerPlugin(
                configuration: NetworkLoggerPlugin.Configuration(logOptions: .verbose)
            )
        )
        #endif

        return MoyaProvider<MuseJobTarget>(plugins: plugins)
    }()
    
    func requestMuseJobs() -> [Job]{
        var jobs: [Job] = []
        let _ = middlewareMuseJobProvider.request(.engineeringJobs){ result in
            switch result {
            case .success(let response):
                do {
                    jobs = try response.map([Job].self, atKeyPath: "results")
                } catch {
                    print("Error Encoding Jobs")
                }
            case .failure(let error):
                print(error)
            }
        }
        return jobs
    }
}
