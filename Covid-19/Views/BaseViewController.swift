//
//  BaseViewController.swift
//  Covid-19
//
//  Created by Matheus Holanda Pinheiro de Albuquerque on 23/03/20.
//  Copyright © 2020 Matheus Holanda. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    let worldwideViewModel = WorldwideViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        worldwideViewModel.getWorldwideCases()
    }
}
