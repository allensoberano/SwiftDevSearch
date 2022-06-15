//
//  AboutViewController.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/10/22.
//

import UIKit
import SnapKit

class AboutViewController: UIViewController {

    private let viewModel: AboutViewModel
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let stackView = UIStackView()

    init() {
        viewModel = AboutViewModel()
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("This init method shouldn't ever be used")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        instantiate()
    }
}

extension AboutViewController: ViewContainer {
    func styleView() {
        view.backgroundColor = .white
    }

    func addSubviews() {
        addImageView()
        addTitleLabel()
        addStackView()
        addContent()
    }

    private func addImageView() {
        view.addSubview(imageView)
        imageView.image = UIImage(named: viewModel.logoTitle)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true

        imageView.snp.makeConstraints { (make) in
            make.top.equalTo(view.snp.topMargin)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(200)
        }
    }

    private func addTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.text = viewModel.title
        titleLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        titleLabel.textAlignment = .center
        titleLabel.adjustsFontForContentSizeCategory = true

        titleLabel.snp.makeConstraints {(make) in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(imageView.snp.bottomMargin)
        }
    }

    private func addStackView() {
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 10

        stackView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.top.equalTo(titleLabel.snp.bottomMargin).offset(50)
        }
    }

    private func addContent() {

        for (index, value) in viewModel.headers.enumerated() {
            addHeaderLabel(with: value)
            addBodyLabel(with: viewModel.body[index])
        }
    }

    private func addHeaderLabel(with title: String) {
        let headerLabel = UILabel()
        stackView.addArrangedSubview(headerLabel)
        headerLabel.text = title
        headerLabel.font = UIFont.preferredFont(forTextStyle: .title2)
    }

    private func addBodyLabel(with body: String) {
        let bodyLabel = UILabel()
        stackView.addArrangedSubview(bodyLabel)
        bodyLabel.text = body
        bodyLabel.font = UIFont.preferredFont(forTextStyle: .body)
        bodyLabel.numberOfLines = 0
    }
}
