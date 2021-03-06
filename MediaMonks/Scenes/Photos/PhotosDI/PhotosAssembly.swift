//
//  PhotosAssembly.swift
//  MediaMonks
//
//  Created by Karim Cordilia on 01/03/2021.
//

import Swinject
import SwinjectAutoregistration

class PhotosAssembly: Assembly {
    func assemble(container: Container) {

        // MARK: Photos
        container.register(PhotosRouterProtocol.self) { resolver in
            return PhotosRouter(
                rootNavigator: resolver ~> (RootNavigatorProtocol.self),
                photoDetailStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.photoDetail.name)
            )
        }

        container.autoregister(PhotosInteractorProtocol.self, initializer: PhotosInteractor.init)

        container.autoregister(PhotosPresenterProtocol.self, initializer: PhotosPresenter.init)

        container.storyboardInitCompleted(PhotosViewController.self) { resolver, vc in

            let presenter = resolver ~> (PhotosPresenterProtocol.self)
            let router = resolver ~> (PhotosRouterProtocol.self)

            router.set(viewController: vc)
            presenter.set(viewController: vc)
            vc.set(router: router)
            vc.set(interactor: resolver ~> (PhotosInteractorProtocol.self))
        }
    }
}

