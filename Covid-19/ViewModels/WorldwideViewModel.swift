//
//  WorldwideViewModel.swift
//  Covid-19
//
//  Created by Matheus Holanda Pinheiro de Albuquerque on 23/03/20.
//  Copyright © 2020 Matheus Holanda. All rights reserved.
//

import UIKit

protocol WorldwideViewModelDelegate: class {
    func requestSuccess()
    func requestFailure()
}

class WorldwideViewModel {
    
    var worldwideCases: Cases?
    weak var delegate: WorldwideViewModelDelegate?
    
    func getWorldwideCases() {
        ApiClient.shared.fetchAllWorldwideCases { (cases) in
            switch cases {
            case .success(let cases):
                self.worldwideCases = cases
                self.delegate?.requestSuccess()
            case .failure(let error):
                print("Failed to fetch Worldwide Cases: ", error.localizedDescription)
                self.delegate?.requestFailure()
            }
        }
    }
    
    func getNumberOfRows() -> Int {
        return 11
    }
    
    func rowHeight() -> CGFloat {
        return 74
    }
    
    func getCases() -> Cases {
        return self.worldwideCases ?? Cases()
    }
}
