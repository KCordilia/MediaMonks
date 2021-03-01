//
//  PhotoDetailStoryboard.swift
//  MediaMonks
//
//  Created by Karim Cordilia on 01/03/2021.
//

import Swinject
import SwinjectStoryboard

enum PhotoDetailStoryboardId: StoryboardId {
    case photoDetail

    var identifier: String {
        switch self {
        case .photoDetail:
            return R.storyboard.photoDetail.photoDetailViewController.identifier
        }
    }
}

class PhotoDetailStoryboard: Storyboard {

    private let container: Container
    private let assembly: Assembly
    private let storyboard: SwinjectStoryboard

    init(sharedContainer: Container, assembly: Assembly) {
        self.assembly = assembly
        container = Container(parent: sharedContainer)
        assembly.assemble(container: container)
        storyboard = SwinjectStoryboard.create(name: R.storyboard.photoDetail.name, bundle: nil, container: container)
    }

    func initial<T>() -> T? where T: UIViewController {
        return storyboard.instantiateInitialViewController() as? T
    }

    func viewController<T>(identifier: StoryboardId) -> T? where T: UIViewController {
        return storyboard.instantiateViewController(withIdentifier: identifier.identifier) as? T
    }
}

