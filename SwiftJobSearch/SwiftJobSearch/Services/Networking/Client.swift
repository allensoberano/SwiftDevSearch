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
    
//    func requestMuseJob() -> <#Return Type#>(){
//        return middlewareMuseJobProvider.request(.engineeringJobs){ result in
//            switch result {
//            case .success(let response):
//                do {
//                    let results = try response.map([Job].self, atKeyPath: "results")
//                    self.jobs = results
//                    self.tableView.reloadData()
//                } catch {
//                    print("Error Encoding Jobs")
//                }
//            case .failure(let error):
//               print(error)
//            }
//        }
//    }
}
