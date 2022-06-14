//
//  JobSearchViewController.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/13/22.
//

import Moya
import UIKit
import SnapKit

struct JobSearchViewModel {
    var jobs: [Job] = []
    let provider = MoyaProvider<MuseJobTarget>()
    
}

class JobSearchViewController: UIViewController {
    
    let viewModel: JobSearchViewModel
    var jobs: [Job] = []
    let provider = MoyaProvider<MuseJobTarget>()
    let tableView = UITableView()
    
    init() {
        viewModel = JobSearchViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        instantiate()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        provider.request(.engineeringJobs){ result in
            switch result {
            case .success(let response):
                do {
                    let results = try response.map([Job].self, atKeyPath: "results")
                    self.jobs = results
                    self.tableView.reloadData()
                } catch {
                    print("Error Encoding Jobs")
                }
            case .failure(let error):
               print(error)
            }
        }
    }
}

extension JobSearchViewController: ViewContainer {
    func styleView() {
        view.backgroundColor = .white
    }
    
    func addSubviews() {
        addTableView()
    }
    
    private func addTableView(){
        view.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
}

extension JobSearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = jobs[indexPath.row].jobTitle
        return cell
    }
    
    
}

