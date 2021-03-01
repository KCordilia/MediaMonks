//
//  SharedAssembly.swift
//  MediaMonks
//
//  Created by Karim Cordilia on 01/03/2021.
//

import UIKit
import Swinject
import SwinjectAutoregistration
import Moya

class SharedAssembly: Assembly {
    let sharedContainer = Container()

    func assemble(container: Container) {
        container.register(UIApplicationProtocol.self) { _ in UIApplication.shared }

        // Top View Controller Provider
        container.autoregister(TopViewControllerProviderProtocol.self, initializer: TopViewControllerProvider.init)

        // Root
        container.register(RootNavigatorProtocol.self) { resolver in
            return RootNavigator(
                application: resolver ~> UIApplicationProtocol.self,
                albumsStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.albums.name)
            )
        }

        // MARK: Services
        container.register(MoyaProvider<AlbumService>.self) { _ in MoyaProvider<AlbumService>() }
        container.register(MoyaProvider<PhotoService>.self) { _ in MoyaProvider<PhotoService>() }
        // MARK: Storyboards

        container.storyboardInitCompleted(NavigationController.self) { resolver, nc in
            nc.prepare()
        }

        // Home
        container.register(Storyboard.self, name: R.storyboard.albums.name) { _ in
            return AlbumsStoryboard(sharedContainer: self.sharedContainer, assembly: AlbumsAssembly())
        }

        // Photos
        container.register(Storyboard.self, name: R.storyboard.photos.name) { _ in
            return PhotosStoryboard(sharedContainer: self.sharedContainer, assembly: PhotosAssembly())
        }

        // Photo Detail
//        container.register(Storyboard.self, name: R.storyboard.photoDetail.name) { _ in
//            return PhotoDetailStoryboard(sharedContainer: self.sharedContainer, assembly: PhotoDetailAssembly())
//        }
    }
}

