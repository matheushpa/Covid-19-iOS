//
//  WorldwideViewModel.swift
//  Covid-19
//
//  Created by Matheus Holanda Pinheiro de Albuquerque on 23/03/20.
//  Copyright © 2020 Matheus Holanda. All rights reserved.
//

import UIKit

class WorldwideViewModel {
    
    var worldwideCases: Cases?
    
    func getWorldwideCases() {
        ApiClient.shared.fetchAllWorldwideCases { (cases) in
            switch cases {
            case .success(let cases):
                self.worldwideCases = cases
            case .failure(let error):
                print("Failed to fetch Worldwide Cases: ", error.localizedDescription)
            }
        }
    }
}
