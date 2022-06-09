//
//  ViewController.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/8/22.
//

import UIKit
import SnapKit

class RootViewController: UIViewController {

    //var myButton: UIButton!
    private let myButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        instantiate()

    }
}

extension RootViewController: ViewContainer {
    func styleView() {
        view.backgroundColor = .green
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
    
    func addSubviews() {
        addMyButton()
    }
    
    private func addMyButton(){
        myButton.setTitle("myButton", for: .normal)
        myButton.backgroundColor = .white
        myButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(myButton)

        myButton.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.height.equalTo(50)
        }
    }
}


extension RootViewController: InteractionResponder {
    func setupInteractions() {
        myButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
    @objc private func buttonClicked(){
        let secondVC = SecondViewController()
        navigationController?.pushViewController(secondVC, animated: true)
    }
}

