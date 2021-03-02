//
//  ErrorHandler.swift
//  MediaMonks
//
//  Created by Karim Cordilia on 02/03/2021.
//

import UIKit

protocol ErrorHandlerProtocol {
    func handle(_ error: Error)
}

class ErrorHandler: ErrorHandlerProtocol {

    private let alertPresenter: AlertPresenterProtocol

    init(
        alertPresenter: AlertPresenterProtocol
        ) {
        self.alertPresenter = alertPresenter
    }

    func handle(_ error: Error) {
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertPresenter.presentAlert(
            title: "Something went wrong",
            description: error.localizedDescription,
            actions: [okAction])
    }
}

