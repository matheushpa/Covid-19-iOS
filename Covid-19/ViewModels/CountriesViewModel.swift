//
//  CountriesViewModel.swift
//  Covid-19
//
//  Created by Matheus Holanda Pinheiro de Albuquerque on 23/03/20.
//  Copyright © 2020 Matheus Holanda. All rights reserved.
//

import UIKit

protocol CountriesViewModelDelegate: class {
    func requestSuccess()
    func requestFailure()
}

class CountriesViewModel {
    
    var countriesCases: [Cases]?
    weak var delegate: CountriesViewModelDelegate?
    
    func getCountriesCases() {
        ApiClient.shared.fetchAllCountriesCases { (cases) in
            switch cases {
            case .success(let cases):
                self.countriesCases = cases
                self.delegate?.requestSuccess()
            case .failure(let error):
                print("Failed to fetch Countries Cases: ", error.localizedDescription)
                self.delegate?.requestFailure()
            }
        }
    }
    
    func numberOfCountries() -> Int {
        return self.countriesCases?.count ?? 0
    }
    
    func countryDetails(index: Int) -> Cases {
        return self.countriesCases?[index] ?? Cases()
    }
}
