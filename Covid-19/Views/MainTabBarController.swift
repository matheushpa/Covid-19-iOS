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
        let firstTabBarItem = UITabBarItem(title: kTabBarWorldwide,
                                           image: UIImage(named: "globe"),
                                           selectedImage: UIImage(named: "globe_filled"))
        firstViewController.tabBarItem = firstTabBarItem
        let secondViewController = UINavigationController(rootViewController: CountriesViewController())
        let secondTabBarItem = UITabBarItem(title: kTabBarCountries,
                                            image: UIImage(named: "country"),
                                            selectedImage: UIImage(named: "country_filled"))
        secondViewController.tabBarItem = secondTabBarItem
        self.viewControllers = [firstViewController, secondViewController]
    }
    
    func setupTabBarLayout() {
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().tintColor = UIColor.init(netHex: kPurpleDefaultColor)
        UITabBar.appearance().unselectedItemTintColor = .gray
    }
}
