//
//  AlbumsAssembly.swift
//  MediaMonks
//
//  Created by Karim Cordilia on 01/03/2021.
//

import Swinject
import SwinjectAutoregistration

class AlbumsAssembly: Assembly {
    func assemble(container: Container) {

        // MARK: Albums
        container.register(AlbumsRouterProtocol.self) { resolver in
            return AlbumsRouter(
                rootNavigator: resolver ~> (RootNavigatorProtocol.self),
                photosStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.photos.name)
            )
        }

        container.autoregister(AlbumsInteractorProtocol.self, initializer: AlbumsInteractor.init)

        container.autoregister(AlbumsPresenterProtocol.self, initializer: AlbumsPresenter.init)

        container.storyboardInitCompleted(AlbumsViewController.self) { resolver, vc in

            let presenter = resolver ~> (AlbumsPresenterProtocol.self)
            let router = resolver ~> (AlbumsRouterProtocol.self)

            router.set(viewController: vc)
            presenter.set(viewController: vc)
            vc.set(router: router)
            vc.set(interactor: resolver ~> (AlbumsInteractorProtocol.self))
        }
    }
}
