//
//  Client+MuseJobService.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/12/22.
//

import Foundation

extension Client: MuseJobService {

    func getJobs(completion: @escaping (Result<JobResponse, Error>) -> Void) {
        requestMuseJobs(completion: completion)
    }
}
