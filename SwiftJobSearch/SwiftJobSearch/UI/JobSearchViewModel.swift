//
//  JobSearchViewModel.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/14/22.
//

import Moya

class JobSearchViewModel {
    var jobs: [Job] = []
    let provider = MoyaProvider<MuseJobTarget>()
    weak var delegate: JobSearchViewModelProtocol?
    
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager = NetworkManager()) {
        self.networkManager = networkManager
    }
    
    func loadJobs(){
        networkManager.getJobs { [weak self] result in
            switch result {
            case .success(let response):
                self?.jobs = response.results
                self?.delegate?.onUpdateJobs()
            case .failure(let error):
               print(error)
            }
        }
    }
}
