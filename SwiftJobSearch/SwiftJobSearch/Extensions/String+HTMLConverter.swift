//
//  String+HTMLConverter.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/14/22.
//

import Foundation

extension String {
    func htmlToAttributedString() -> NSAttributedString? {
        let data = Data(self.utf8)
        let attributedString = try? NSAttributedString(
            data: data,
            options: [
                .documentType: NSAttributedString.DocumentType.html,
                .characterEncoding: String.Encoding.utf8.rawValue
            ], documentAttributes: nil)
        return attributedString
    }
}
