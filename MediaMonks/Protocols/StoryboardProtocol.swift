//
//  StoryboardProtocol.swift
//  MediaMonks
//
//  Created by Karim Cordilia on 01/03/2021.
//

import Foundation
import Swinject
import SwinjectStoryboard

protocol StoryboardId {
    var identifier: String { get }
}

//sourcery: AutoMockable
protocol Storyboard {
    func initial<T: UIViewController>() -> T?
    func viewController<T: UIViewController>(identifier: StoryboardId) -> T?
}



