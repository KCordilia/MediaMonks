//
//  PhotoDetailAssembly.swift
//  MediaMonks
//
//  Created by Karim Cordilia on 01/03/2021.
//

import Swinject
import SwinjectAutoregistration

class PhotoDetailAssembly: Assembly {
    func assemble(container: Container) {

        // MARK: PhotoDetail
        
        container.autoregister(PhotoDetailInteractorProtocol.self, initializer: PhotoDetailInteractor.init)
        container.storyboardInitCompleted(PhotoDetailViewController.self) { resolver, vc in
            vc.set(interactor: resolver ~> (PhotoDetailInteractorProtocol.self))
        }
    }
}

