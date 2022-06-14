//
//  MuseJobService.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/12/22.
//

import Foundation

protocol MuseJobService {
    func getJobs(completion: @escaping (Result<JobResponse, Error>) -> Void)
}
