//
//  SceneDelegate.swift
//  MiniProjeto
//
//  Created by Softbuilder Informatica on 14/12/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    
    
    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let _ = (scene as? UIWindowScene) else { return }
        
        if let windowsScene = scene as? UIWindowScene{
            
            self.window = UIWindow(windowScene: windowsScene)
            self.window?.rootViewController = ProductsViewController()
            self.window!.makeKeyAndVisible()
            
        }
        
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }


}

