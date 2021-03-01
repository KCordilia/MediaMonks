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

        // MARK: Home
        container.register(PhotoDetailRouterProtocol.self) { resolver in
            return PhotoDetailRouter(
                rootNavigator: resolver ~> (RootNavigatorProtocol.self)
            )
        }

        container.autoregister(PhotoDetailInteractorProtocol.self, initializer: PhotoDetailInteractor.init)

        container.autoregister(PhotoDetailPresenterProtocol.self, initializer: PhotoDetailPresenter.init)

        container.storyboardInitCompleted(PhotoDetailViewController.self) { resolver, vc in

            let presenter = resolver ~> (PhotoDetailPresenterProtocol.self)
            let router = resolver ~> (PhotoDetailRouterProtocol.self)

            router.set(viewController: vc)
            presenter.set(viewController: vc)
            vc.set(router: router)
            vc.set(interactor: resolver ~> (PhotoDetailInteractorProtocol.self))
        }
    }
}

