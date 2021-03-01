//
//  MediaMonksApp.swift
//  MediaMonks
//
//  Created by Karim Cordilia on 01/03/2021.
//

import Foundation
import Swinject
import SwinjectAutoregistration

protocol MediaMonksAppProtocol {
    func prepare()
}

class MediaMonksApp: MediaMonksAppProtocol {

    private let sharedContainer: Container
    private let sharedAssembly: Assembly
    private let rootNavigator: RootNavigatorProtocol

    init(
        sharedAssembly: Assembly,
        sharedContainer: Container
    ) {
        self.sharedAssembly = sharedAssembly
        self.sharedContainer = sharedContainer
        sharedAssembly.assemble(container: self.sharedContainer)
        rootNavigator = sharedContainer ~> RootNavigatorProtocol.self
    }

    convenience init() {
        let sharedAssembly = SharedAssembly()
        let sharedContainer = sharedAssembly.sharedContainer

        self.init(
            sharedAssembly: sharedAssembly,
            sharedContainer: sharedContainer
        )
    }

    func prepare() {
        rootNavigator.setRootViewController()
    }
}
