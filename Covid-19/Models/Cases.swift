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
    var countryInfo: Country?
    var country: String?
    var todayCases: Int?
    var todayDeaths: Int?
    var active: Int?
    var critical: Int?
    var casesPerOneMillion: Float?
    var deathsPerOneMillion: Float?
    var tests: Int?
    var testsPerOneMillion: Float?
    var affectedCountries: Int?
    
    enum CodingKeys: String, CodingKey {
        case cases, deaths, recovered, updated, country, todayCases, active, critical, countryInfo, casesPerOneMillion, deathsPerOneMillion, tests, testsPerOneMillion, affectedCountries, todayDeaths
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

class Country: Codable {
    
    var flag: String?
    var iso2: String?
    var iso3: String?
    var _id: Int?
    var lat: Float?
    var long: Float?
    
    enum CodingKeys: String, CodingKey {
        case flag, iso2, iso3, lat, long, _id
    }
}
