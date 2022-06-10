//
//  CollectionViewConfiguration.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/10/22.
//

import UIKit

protocol CollectionViewConfiguration {
    func configureLayout() -> UICollectionViewCompositionalLayout
    func configureDataSource()
}
