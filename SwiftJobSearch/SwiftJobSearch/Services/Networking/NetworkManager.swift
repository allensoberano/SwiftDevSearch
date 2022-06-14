//
//  NetworkManager.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/14/22.
//

import Foundation
import Moya

protocol Networkable {
    var provider: MoyaProvider<MuseJobTarget> { get }
    
    func getJobs(completion: @escaping (Result<JobResponse, Error>) -> ())

}

class NetworkManager: Networkable {
    
    var provider = MoyaProvider<MuseJobTarget>()
    
    func getJobs(completion: @escaping (Result<JobResponse, Error>) -> ())  {
        request(target: .engineeringJobs, completion: completion)
    }
    
    private func request<T: Decodable>(target: MuseJobTarget, completion: @escaping (Result<T, Error>) -> ()) {        provider.request(.engineeringJobs){ result in
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
