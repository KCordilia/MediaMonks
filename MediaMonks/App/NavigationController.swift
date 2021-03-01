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
        navigationBar.barTintColor = #colorLiteral(red: 0.07843137255, green: 0.07843137255, blue: 0.1843137255, alpha: 1)
        navigationBar.tintColor = #colorLiteral(red: 0.2156862745, green: 1, blue: 0.5607843137, alpha: 1)
        let textAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.2156862745, green: 1, blue: 0.5607843137, alpha: 1)]
        navigationBar.titleTextAttributes = textAttributes
    }
}

