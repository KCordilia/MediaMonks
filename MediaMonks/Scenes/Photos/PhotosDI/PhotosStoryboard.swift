//
//  PhotosStoryboard.swift
//  MediaMonks
//
//  Created by Karim Cordilia on 01/03/2021.
//
import Swinject
import SwinjectStoryboard

enum PhotosStoryboardId: StoryboardId {
    case photos

    var identifier: String {
        switch self {
        case .photos:
            return R.storyboard.photos.photosViewController.identifier
        }
    }
}

class PhotosStoryboard: Storyboard {

    private let container: Container
    private let assembly: Assembly
    private let storyboard: SwinjectStoryboard

    init(sharedContainer: Container, assembly: Assembly) {
        self.assembly = assembly
        container = Container(parent: sharedContainer)
        assembly.assemble(container: container)
        storyboard = SwinjectStoryboard.create(name: R.storyboard.photos.name, bundle: nil, container: container)
    }

    func initial<T>() -> T? where T: UIViewController {
        return storyboard.instantiateInitialViewController() as? T
    }

    func viewController<T>(identifier: StoryboardId) -> T? where T: UIViewController {
        return storyboard.instantiateViewController(withIdentifier: identifier.identifier) as? T
    }
}
