//
//  Cases.swift
//  Covid-19
//
//  Created by Matheus Holanda Pinheiro de Albuquerque on 23/03/20.
//  Copyright © 2020 Matheus Holanda. All rights reserved.
//

import Foundation

class Cases: Codable {
    
    var cases: Int?
    var deaths: Int?
    var recovered: Int?
    var updated: Int?
    
    enum CodingKeys: String, CodingKey {
        case cases, deaths, recovered, updated
    }
    
    static func decode(from data: Data) -> Cases? {
        let decoded = try? JSONDecoder().decode(Cases.self, from: data)
        return decoded
    }
    
    static func decodeCountries(from data: Data) -> [Cases]? {
        let decoded = try? JSONDecoder().decode([Cases].self, from: data)
        return decoded
    }
}
