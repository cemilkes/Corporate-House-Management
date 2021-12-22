//
//  ListingsAPI.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/22/21.
//

import Foundation

class ListingsAPI {
    
    static let shared = ListingsAPI()
    
    func getListings(for clientId: String, clientSecret: String, hostUserDefault: String, page: Int, completion: @escaping (Result<Listings, CHError>) -> Void) {
        
        let endpoint =  AppConstants.baseURL + "listings?per_page=20&page=\(page)"
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.invalidCredentials))
            return
        }
        
        let token = UserDefaults.standard.value(forKey: hostUserDefault) as? String ?? "no token found"
        
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
    
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            
            do {
              let jsonDecoder   = JSONDecoder()
              let listings      = try jsonDecoder.decode(Listings.self, from: data)
                completion(.success(listings))
                print(listings)
            } catch {
                completion(.failure(.invalidData))
            }
        }.resume()
    }
    
    
}
