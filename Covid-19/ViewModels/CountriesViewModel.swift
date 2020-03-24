//
//  CountriesViewModel.swift
//  Covid-19
//
//  Created by Matheus Holanda Pinheiro de Albuquerque on 23/03/20.
//  Copyright © 2020 Matheus Holanda. All rights reserved.
//

import UIKit

class CountriesViewModel {
    
    var countriesCases: [Cases]?
    
    func getCountriesCases() {
        ApiClient.shared.fetchAllCountriesCases { (cases) in
            switch cases {
            case .success(let cases):
                self.countriesCases = cases
            case .failure(let error):
                print("Failed to fetch Countries Cases: ", error.localizedDescription)
            }
        }
    }
}
