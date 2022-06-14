//
//  RootViewCollectionViewCell.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/9/22.
//

import UIKit
import SnapKit

class RootViewCollectionViewCell: UICollectionViewCell {

    static let reuseIdentifer = "rootview-item-cell-reuse-identifider"

    private let stackView = UIStackView()
    private let iconImageView = UIImageView()
    private let titleLabel = UILabel()

    // MARK: - Initializations -
    override init(frame: CGRect) {
      super.init(frame: frame)

        instantiate()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Internal Functions -
    func update(title: String, icon: UIImage) {
        iconImageView.image = icon
        titleLabel.text = title
    }
}

extension RootViewCollectionViewCell: ViewContainer {
    func styleView() {
    }

    func addSubviews() {
        addStackView()
        addIconImageView()
        addTitleView()
    }

    private func addStackView() {
        contentView.addSubview(stackView)
        stackView.layer.cornerRadius = 10
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.backgroundColor = .random
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)

        stackView.snp.makeConstraints { (make) in
            make.leading.equalTo(contentView.snp.leading).offset(5)
            make.trailing.equalTo(contentView.snp.trailing).inset(5)
            make.top.equalTo(contentView.snp.top).offset(5)
            make.bottom.equalTo(contentView.snp.bottom)
        }
    }

    private func addIconImageView() {
        stackView.addArrangedSubview(iconImageView)
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.clipsToBounds = true
        iconImageView.tintColor = .white

        iconImageView.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalTo(100)
        }
    }

    private func addTitleView() {
        stackView.addArrangedSubview(titleLabel)
        titleLabel.textColor = .white
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        titleLabel.adjustsFontForContentSizeCategory = true
    }
}
