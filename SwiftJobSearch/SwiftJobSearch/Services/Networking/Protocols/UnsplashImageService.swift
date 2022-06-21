//
//  UnsplashImage.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/20/22.
//

import Foundation

protocol UnsplashImageService {
    func getImages(completion: @escaping (Result<UnsplashResponse, Error>) -> Void)
}
