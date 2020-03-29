//
//  CountryDetailsViewController.swift
//  Covid-19
//
//  Created by Matheus Holanda Pinheiro de Albuquerque on 29/03/20.
//  Copyright © 2020 Matheus Holanda. All rights reserved.
//

import UIKit

class CountryDetailsViewController: BaseViewController {

    let viewModel = CountryDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.getCountryCase(country: "Brazil")
    }
}
