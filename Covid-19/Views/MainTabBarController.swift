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
        let firstViewController = UINavigationController(rootViewController: WorldwideViewController())
        let firstTabBarItem = UITabBarItem(title: "Worldwide",
                                           image: UIImage(named: ""),
                                           selectedImage: UIImage(named: ""))
        firstViewController.tabBarItem = firstTabBarItem
        let secondViewController = UINavigationController(rootViewController: CountriesViewController())
        let secondTabBarItem = UITabBarItem(title: "Countries",
                                            image: UIImage(named: ""),
                                            selectedImage: UIImage(named: ""))
        secondViewController.tabBarItem = secondTabBarItem
        let thirdViewController = UINavigationController(rootViewController: CoronaViewController())
        let thirdTabBarItem = UITabBarItem(title: "Corona",
                                            image: UIImage(named: ""),
                                            selectedImage: UIImage(named: ""))
        thirdViewController.tabBarItem = thirdTabBarItem
        self.viewControllers = [firstViewController, secondViewController, thirdViewController]
    }
    
    func setupTabBarLayout() {
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().tintColor = UIColor(red: 68/255, green: 22/255, blue: 70/255, alpha: 1)
        UITabBar.appearance().unselectedItemTintColor = .gray
    }
}
