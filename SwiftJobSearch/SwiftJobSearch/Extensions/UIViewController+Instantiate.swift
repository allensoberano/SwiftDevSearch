//
//  UIViewController+Instantiate.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/9/22.
//

import UIKit

extension UIViewController {
    func instantiate(){
        if let viewContainer = self as? ViewContainer {
            viewContainer.styleView()
            viewContainer.addSubviews()
        }
        
        if let responder = self as? InteractionResponder {
            responder.setupInteractions()
        }
        
    }
}
