//
//  SceneDelegate.swift
//  ReceipeCollectionApp
//
//  Created by Yuliya Lapenak on 10/4/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let rootViewController = UINavigationController(rootViewController: ReceipeListViewController())
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        self.window = window
    }

}

