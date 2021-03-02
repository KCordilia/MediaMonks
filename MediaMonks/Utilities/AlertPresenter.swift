//
//  AlertPresenter.swift
//  MediaMonks
//
//  Created by Karim Cordilia on 02/03/2021.
//

import UIKit

protocol AlertPresenterProtocol {
    func presentAlert(title: String?, description: String?, actions: [UIAlertAction])
}

class AlertPresenter: AlertPresenterProtocol {
    private let topViewControllerProvider: TopViewControllerProviderProtocol

    init(topViewControllerProvider: TopViewControllerProviderProtocol) {
        self.topViewControllerProvider = topViewControllerProvider
    }

    func presentAlert(title: String?, description: String?, actions: [UIAlertAction]) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
            actions.forEach { alert.addAction($0) }
            self.topViewControllerProvider.topViewController()?.present(alert, animated: true, completion: nil)
        }
    }
}
