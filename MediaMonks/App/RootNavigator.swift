//
//  RootNavigator.swift
//  MediaMonks
//
//  Created by Karim Cordilia on 01/03/2021.
//

import Foundation

protocol RootNavigatorProtocol {
    func setRootViewController()
}

class RootNavigator: RootNavigatorProtocol {
    private var application: UIApplicationProtocol
    private let albumsStoryboard: Storyboard

    init(
        application: UIApplicationProtocol,
        albumsStoryboard: Storyboard
    ) {
        self.application = application
        self.albumsStoryboard = albumsStoryboard
    }

    func setRootViewController() {
        guard let vc = albumsStoryboard.initial() else { return }
        let navigationController = NavigationController(rootViewController: vc)
        application.rootViewController = navigationController
    }
}

