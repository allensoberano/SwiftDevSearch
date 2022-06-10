//
//  UITableView+DefaultIdentifier.swift
//  SwiftJobSearch
//
//  Created by Allen Soberano on 6/9/22.
//

import UIKit

extension UITableView {
    func registerClassForCellReuse<T: UITableViewCell>(_: T.Type) {
        register(T.self, forCellReuseIdentifier: NSStringFromClass(T.self))
    }

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T {
        let identifier = NSStringFromClass(T.self)
        guard let cell = dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T
            else {
                fatalError("Could not dequeue cell with identifier: \(identifier)")
            }

        return cell
    }
}

