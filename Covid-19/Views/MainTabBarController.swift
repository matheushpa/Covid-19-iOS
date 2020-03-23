//
//  MainTabBarController.swift
//  Covid-19
//
//  Created by Matheus Holanda Pinheiro de Albuquerque on 23/03/20.
//  Copyright © 2020 Matheus Holanda. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarViews()
        setupTabBarLayout()
    }
    
    // MARK: - Setup methods
    func setupTabBarViews() {
        let firstViewController = UINavigationController(rootViewController: BaseViewController())
        let firstTabBarItem = UITabBarItem(title: "Test",
                                           image: UIImage(named: ""),
                                           selectedImage: UIImage(named: ""))
        firstViewController.tabBarItem = firstTabBarItem
        let secondViewController = UINavigationController(rootViewController: BaseViewController())
        let secondTabBarItem = UITabBarItem(title: "Test 2",
                                            image: UIImage(named: ""),
                                            selectedImage: UIImage(named: ""))
        secondViewController.tabBarItem = secondTabBarItem
        self.viewControllers = [firstViewController, secondViewController]
    }
    
    func setupTabBarLayout() {
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().tintColor = UIColor(red: 49/255, green: 172/255, blue: 151/255, alpha: 1)
        UITabBar.appearance().unselectedItemTintColor = .gray
    }
}
