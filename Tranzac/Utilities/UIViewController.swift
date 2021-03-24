//
//  UIViewController.swift
//  Tranzac
//
//  Created by macexpert on 24/03/21.
//

import UIKit

// MARK: - Return View Controller
extension UIViewController {
    
    func findContentViewControllerRecursively() -> UIViewController {
        var childViewController: UIViewController?
        if self is UITabBarController {
            childViewController = (self as? UITabBarController)?.selectedViewController
        } else if self is UINavigationController {
            childViewController = (self as? UINavigationController)?.topViewController
        } else if self is UISplitViewController {
            childViewController = (self as? UISplitViewController)?.viewControllers.last
        } else if self.presentedViewController != nil {
            childViewController = self.presentedViewController
        }
        let shouldContinueSearch: Bool = (childViewController != nil) && !((childViewController?.isKind(of: UIAlertController.self))!)
        return shouldContinueSearch ? childViewController!.findContentViewControllerRecursively() : self
    }
}

// MARK: - UIApplication
/// Get Root view or Scene Controller
extension UIApplication {
    
    class var scene: UIViewController! {
        let sceneDelegate = UIApplication.shared.connectedScenes
            .first!.delegate as! SceneDelegate
        return sceneDelegate.window?.rootViewController
    }
    
    class var appWindow: UIWindow! {
        return (UIApplication.shared.delegate?.window!)!
    }
    
    class var rootViewController: UIViewController! {
        return self.appWindow.rootViewController!
    }
    
    class var visibleViewController: UIViewController! {
        return self.rootViewController.findContentViewControllerRecursively()
    }
}
