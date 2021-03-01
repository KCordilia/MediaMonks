//
//  NavigationController.swift
//  MediaMonks
//
//  Created by Karim Cordilia on 01/03/2021.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        prepare()
    }

    func prepare() {
        navigationBar.barTintColor = #colorLiteral(red: 0.1019607843, green: 0.1019607843, blue: 0.1019607843, alpha: 1)
        navigationBar.tintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        let textAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)]
        navigationBar.titleTextAttributes = textAttributes
        navigationBar.backIndicatorImage = UIImage(systemName: "chevron.left")
        navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "chevron.left")
    }
}
