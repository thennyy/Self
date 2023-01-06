//
//  SceneDelegate.swift
//  KemMookWikipedia
//
//  Created by Thenny Chhorn on 12/5/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

//       let layout = UICollectionViewFlowLayout()
//        let contentView = UINavigationController(rootViewController: CalendarCollectionController(collectionViewLayout: layout))
        
        let contentView = UINavigationController(rootViewController: HomeCController())
        
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = contentView
            self.window = window
            window.makeKeyAndVisible()
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

        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

