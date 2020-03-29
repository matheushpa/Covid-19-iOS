//
//  ApiConfig.swift
//  Covid-19
//
//  Created by Matheus Holanda Pinheiro de Albuquerque on 29/03/20.
//  Copyright © 2020 Matheus Holanda. All rights reserved.
//

import UIKit

class ApiConfig: NSObject {

    class func getApiSettingsItem(_ item: String) -> AnyObject {
        if let filePath = Bundle.main.path(forResource: "ApiConfig", ofType: "plist"), let stylesheet = NSDictionary(contentsOfFile: filePath) {
            return stylesheet.object(forKey: item) as AnyObject
        } else {
            return "" as AnyObject
        }
    }
    
    class func getMainEnvironment() -> String {
        return ApiConfig.getApiSettingsItem("baseURL") as? String ?? ""
    }
}
