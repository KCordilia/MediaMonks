//
//  AlbumsInteractor.swift
//  MediaMonks
//
//  Created by Karim Cordilia on 01/03/2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//
//  This template is meant to work with Swinject.

import UIKit

protocol AlbumsInteractorProtocol {
    // add the functions that are called from the view controller
}

class AlbumsInteractor: AlbumsInteractorProtocol {

    // MARK: DI
    var presenter: AlbumsPresenterProtocol

    init(presenter: AlbumsPresenterProtocol) {
        self.presenter = presenter
    }
}
