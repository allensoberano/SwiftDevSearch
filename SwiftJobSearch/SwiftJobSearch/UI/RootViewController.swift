//
//  ViewController.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/8/22.
//

import UIKit
import SnapKit

class RootViewController: UIViewController {
    //// About
    //** Job Search
    //** Podcasts about Code
    //// Places we love
    //** Dev Music
    //** Contact
    //// The Team
    
    private let tableView = UITableView()
    private let menuItems = ["About", "Job Search", "Podcasts", "Places We Love", "Dev Music", "Contact", "The Team"]
    private let menuIcons = ["info.circle", "magnifyingglass.circle", "music.mic", "globe.americas", "headphones", "envelope", "person.3"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        instantiate()
        tableView.dataSource = self
        
    }
}

extension RootViewController: ViewContainer {
    func styleView() {
        styleNavBar()
    }
    
    func addSubviews() {
        addTableView()
    }
    
    private func styleNavBar(){
        navigationItem.title = "Swift Job Search"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .purple
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    
    func addTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RootViewTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(RootViewTableViewCellDouble.self, forCellReuseIdentifier: "doubleCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 135
        
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}


extension RootViewController: InteractionResponder {
    func setupInteractions() {
    }
    
    @objc private func buttonClicked(){
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }
}

extension RootViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RootViewTableViewCell
        cell.update(title: menuItems[indexPath.row], icon: UIImage(systemName: menuIcons[indexPath.row])!)
        //cell.textLabel?.text = categories[indexPath.row]
        return cell
    }
}



