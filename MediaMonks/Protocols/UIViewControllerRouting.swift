//
//  UIViewControllerRouting.swift
//  MediaMonks
//
//  Created by Karim Cordilia on 01/03/2021.
//

import UIKit

protocol UIViewControllerRouting: class {
    func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?)
    func presentPopup(_ viewControllerToPresent: UIViewController)
    func show(_ vc: UIViewController, sender: Any?)
    func pop(animated: Bool)
    func dismiss(animated flag: Bool, completion: (() -> Void)?)
    func popToRoot(animated: Bool)
    func replaceCurrent(with viewController: UIViewController)
    func embed(_ viewController: UIViewController, in containerView: UIView)
}

//sourcery: AutoMockable
protocol UINavigationControllerRouting {
    func popViewController(animated: Bool) -> UIViewController?
    func show(_ vc: UIViewController, sender: Any?)
}

extension UIViewController: UIViewControllerRouting {
    func pop(animated: Bool) {
        navigationController?.popViewController(animated: animated)
    }

    func popToRoot(animated: Bool) {
        navigationController?.popToRootViewController(animated: animated)
    }

    func replaceCurrent(with viewController: UIViewController) {
        var vcs = navigationController?.viewControllers.dropLast() ?? []
        vcs.append(viewController)
        navigationController?.setViewControllers(vcs, animated: true)
    }

    func embed(_ viewController: UIViewController, in containerView: UIView) {
        self.addChild(viewController)
        containerView.addSubview(viewController.view)
        viewController.view.frame = containerView.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        viewController.didMove(toParent: self)
    }

    func presentPopup(_ viewControllerToPresent: UIViewController) {
        viewControllerToPresent.modalTransitionStyle = .crossDissolve
        viewControllerToPresent.modalPresentationStyle = .overCurrentContext
        present(viewControllerToPresent, animated: true)
    }
}


