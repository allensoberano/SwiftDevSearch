//
//  JobSearchViewController.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/13/22.
//

import Moya
import UIKit
import SnapKit

class JobSearchViewController: UIViewController {

    struct JobConstants {
        static let navTitle = "Job Search"
        static let tableViewHeaderImage = "jobSearchHeader"
    }

    let viewModel: JobSearchViewModel
    let provider = MoyaProvider<MuseJobTarget>()
    let tableView = UITableView()
    let spinner = UIActivityIndicatorView(style: .large)

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

        viewModel.delegate = self
        viewModel.loadJobs()
    }
}

extension JobSearchViewController: ViewContainer {
    func styleView() {
        view.backgroundColor = .white
        navigationItem.title = JobConstants.navTitle
    }

    func addSubviews() {
        addTableView()
        addSpinnerView()
    }

    private func addTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }

    private func addSpinnerView() {
        view.addSubview(spinner)
        spinner.hidesWhenStopped = true
        spinner.color = .orange
        spinner.sizeToFit()

        spinner.snp.makeConstraints { (make) in
            make.center.equalTo(tableView.snp.center)
        }

        spinner.startAnimating()
    }
}

extension JobSearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.jobs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = viewModel.jobs[indexPath.row].jobTitle
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = JobDetailsViewController(job: viewModel.jobs[indexPath.row])
        navigationController?.pushViewController(viewController, animated: true)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: JobConstants.tableViewHeaderImage)
        return imageView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 85
    }
}

extension JobSearchViewController: JobSearchViewModelProtocol {
    func onUpdateJobs() {
        print(viewModel.jobs)
        spinner.stopAnimating()
        tableView.reloadData()
    }
}
