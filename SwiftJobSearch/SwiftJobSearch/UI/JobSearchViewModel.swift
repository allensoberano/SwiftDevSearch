//
//  JobSearchViewModel.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/14/22.
//

import Moya

protocol JobSearchViewModelProtocol: AnyObject {
    func onUpdateJobs()
}

class JobSearchViewModel {
    var jobs: [Job] = []
    weak var delegate: JobSearchViewModelProtocol?
    private let client: Client
    
    init(client: Client = Client()) {
        self.client = client
    }
    
    func loadJobs(){
        client.getJobs { [weak self] result in
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
