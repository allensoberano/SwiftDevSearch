//
//  Client+MuseJobService.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/12/22.
//

import Foundation
import Moya

extension Client: MuseJobService {
    
    func getJobs(completion: @escaping (Result<JobResponse, Error>) -> ())  {
        requestMuseJobs(target: .engineeringJobs, completion: completion)
    }
}
