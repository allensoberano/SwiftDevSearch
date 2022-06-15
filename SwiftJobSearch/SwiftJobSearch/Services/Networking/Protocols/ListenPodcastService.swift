//
//  ListenPodcastService.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/15/22.
//

import Foundation

protocol ListenPodcastService {
    func getPodcasts(completion: @escaping (Result<PodcastResponse, Error>) -> Void)
}
