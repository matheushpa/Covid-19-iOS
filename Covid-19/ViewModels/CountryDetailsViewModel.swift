//
//  CountryDetailsViewModel.swift
//  Covid-19
//
//  Created by Matheus Holanda Pinheiro de Albuquerque on 29/03/20.
//  Copyright © 2020 Matheus Holanda. All rights reserved.
//

import UIKit

protocol CountryDetailsViewModelDelegate: class {
    func requestSuccess()
    func requestFailure()
}

class CountryDetailsViewModel {

    var countryCase: Cases?
    weak var delegate: CountryDetailsViewModelDelegate?
    
    func getCountryCase(country: String) {
        ApiClient.shared.fetchCountryCase(country: country) { (countryCase) in
            switch countryCase {
            case .success(let countryCase):
                self.countryCase = countryCase
                self.delegate?.requestSuccess()
            case .failure(let error):
                print("Failed to fetch Country (\(country)) case: ", error.localizedDescription)
                self.delegate?.requestFailure()
            }
        }
    }
}
