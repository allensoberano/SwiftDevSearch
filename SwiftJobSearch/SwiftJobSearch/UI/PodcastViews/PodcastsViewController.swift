//
//  PodcastsViewController.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/15/22.
//

import Moya
import UIKit
import SnapKit

class PodcastsViewController: UIViewController {

    struct PodcastConstants {
        static let navTitle = "Podcasts"
        static let tableViewHeaderImage = "podcastsHeader"
        static let attribution = "Photo by Will Francis on Unsplash"
    }

    let viewModel: PodcastsViewModel
    let provider = MoyaProvider<ListenPodcastsTarget>()
    let tableView = UITableView()
    let spinner = UIActivityIndicatorView(style: .large)

    init() {
        viewModel = PodcastsViewModel()
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
        viewModel.loadPodcasts()
        tableView.reloadData()
    }
}

extension PodcastsViewController: ViewContainer {
    func styleView() {
        view.backgroundColor = .white
        navigationItem.title = PodcastConstants.navTitle
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

extension PodcastsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.podcasts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = viewModel.podcasts[indexPath.row].titleOriginal
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = PodcastsDetailsViewConroller(podcast: viewModel.podcasts[indexPath.row])
        navigationController?.pushViewController(viewController, animated: true)
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: PodcastConstants.tableViewHeaderImage)
        return imageView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 85
    }
}

extension PodcastsViewController: PodcastsViewModelProtocol {
    func onUpdatedPodcasts() {
        spinner.stopAnimating()
        tableView.reloadData()
    }
}
