//
//  PodcastsDetailsViewController.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/15/22.
//

import UIKit
import SnapKit

class PodcastsDetailsViewConroller: UIViewController {
    private let podcast: Podcast
    private let scrollView = UIScrollView()
    private let imageView = UIImageView()
    private let contentView = UIView()
    private let stackView = UIStackView()
    private let podcastTitleView = UILabel()
    private let jobTitleView = UILabel()
    private let podcastDescriptionView = UILabel()
    private let labelOffset = 10

    init(podcast: Podcast) {
        self.podcast = podcast
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

extension PodcastsDetailsViewConroller: ViewContainer {
    func styleView() {
        view.backgroundColor = .white
    }

    func addSubviews() {

        addScrollView()
        addContentView()
        addStackView()
        addImageView()
        addPodcastTitleView()
        addPodcastDescriptionView()
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
        imageView.loadFrom(URLAddress: podcast.image)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true

        imageView.snp.makeConstraints { (make) in
            make.height.equalTo(200)
        }
    }

    private func addPodcastTitleView() {
        stackView.addArrangedSubview(podcastTitleView)
        podcastTitleView.text = podcast.titleOriginal
        podcastTitleView.font = UIFont.preferredFont(forTextStyle: .title2)
        podcastTitleView.adjustsFontSizeToFitWidth = true
        podcastTitleView.textAlignment = .left
        podcastTitleView.numberOfLines = 2
        podcastTitleView.adjustsFontForContentSizeCategory = true
    }

    private func addPodcastDescriptionView() {
        stackView.addArrangedSubview(podcastDescriptionView)

        podcastDescriptionView.attributedText = podcast.descriptionOriginal.htmlToAttributedString()
        podcastDescriptionView.textAlignment = .left
        podcastDescriptionView.numberOfLines = 0
    }
}
