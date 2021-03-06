//
//  ApiClient.swift
//  Covid-19
//
//  Created by Matheus Holanda Pinheiro de Albuquerque on 23/03/20.
//  Copyright © 2020 Matheus Holanda. All rights reserved.
//

import Foundation

class ApiClient {

    var baseURL = "\(ApiConfig.getMainEnvironment())"
        
    static let shared = ApiClient()
    
    func fetchAllWorldwideCases(completion: @escaping (Result<Cases, Error>) -> ()) {
        guard let url = URL(string: baseURL + "all") else { return }
        print(url)
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let errorMessage = error {
                print(errorMessage.localizedDescription)
                completion(.failure(errorMessage))
                return
            } else if let currentData = data, let worldwideCases = Cases.decode(from: currentData) {
                completion(.success(worldwideCases))
            }
            }.resume()
    }
    
    func fetchAllCountriesCases(completion: @escaping (Result<[Cases], Error>) -> ()) {
        guard let url = URL(string: baseURL + "countries") else { return }
        print(url)
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let errorMessage = error {
                print(errorMessage.localizedDescription)
                completion(.failure(errorMessage))
                return
            } else if let currentData = data, let countriesCases = Cases.decodeCountries(from: currentData) {
                completion(.success(countriesCases))
            }
            }.resume()
    }
    
    func fetchCountryCase(country: String, completion: @escaping (Result<Cases, Error>) -> ()) {
        guard let url = URL(string: baseURL + "countries/\(country)") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let errorMessage = error {
                print(errorMessage.localizedDescription)
                completion(.failure(errorMessage))
                return
            } else if let currentData = data, let countryCase = Cases.decode(from: currentData) {
                completion(.success(countryCase))
            }
            }.resume()
    }
}
