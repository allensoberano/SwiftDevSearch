//
//  JobDetailsViewController.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/14/22.
//

import UIKit
import SnapKit

class JobDetailsViewController: UIViewController {

    private let job: Job
    private let scrollView = UIScrollView()
    private let imageView = UIImageView()
    private let contentView = UIView()
    private let stackView = UIStackView()
    private let companyNameView = UILabel()
    private let jobTitleView = UILabel()
    private let jobDescriptionView = UILabel()
    private let labelOffset = 10

    init(job: Job) {
        self.job = job
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

extension JobDetailsViewController: ViewContainer {
    func styleView() {
        view.backgroundColor = .white
    }

    func addSubviews() {

        addScrollView()
        addContentView()
        addStackView()
        addImageView()
        addCompanyNameView()
        addJobTitleView()
        addJobDescriptionView()
    }

    private func addScrollView() {
        view.addSubview(scrollView)
        scrollView.showsVerticalScrollIndicator = true

        scrollView.snp.makeConstraints { (make) in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
    }

    private func addContentView() {
        scrollView.addSubview(contentView)

        contentView.snp.makeConstraints { (make) in
            make.leading.top.trailing.bottom.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.equalTo(scrollView).priority(250)
        }
    }

    private func addStackView() {
        scrollView.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 30

        stackView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview().inset(20)
        }
    }

    private func addImageView() {
        stackView.addArrangedSubview(imageView)
        imageView.image = UIImage(named: "sjs")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true

        imageView.snp.makeConstraints { (make) in
            make.height.equalTo(200)
        }
    }

    private func addCompanyNameView() {
        stackView.addArrangedSubview(companyNameView)
        companyNameView.text = job.company.companyName
        companyNameView.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        companyNameView.textAlignment = .center
        companyNameView.adjustsFontForContentSizeCategory = true
    }

    private func addJobTitleView() {
        stackView.addArrangedSubview(jobTitleView)
        jobTitleView.text = job.jobTitle
        jobTitleView.font = UIFont.preferredFont(forTextStyle: .title2)
        jobTitleView.adjustsFontSizeToFitWidth = true
        jobTitleView.textAlignment = .left
        jobTitleView.numberOfLines = 2
        jobTitleView.adjustsFontForContentSizeCategory = true
    }

    private func addJobDescriptionView() {
        stackView.addArrangedSubview(jobDescriptionView)

        jobDescriptionView.attributedText = job.description.htmlToAttributedString()
        jobDescriptionView.textAlignment = .left
        jobDescriptionView.numberOfLines = 0
    }
}
