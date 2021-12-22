//
//  NetworkManager.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/21/21.
//

import Foundation
class ReservationAPI {
    
    // API CALLS:
    
    // regular way - reservations, listings, listings by id (also diffable collection view)
    
    // using Alamofire - requesting token, calendar api
    
    // using Combine and also use combine for tableview exc. (properties,  properties by Id)
    
    static let shared = ReservationAPI()
  
    let mayProperties: String = PropertyData.shared.getMayPropertiesNames()
    
    func getReservations(startDate: String, endDate: String, host:String, completion: @escaping (Reservation?, String?) -> Void ) {
        // dateformat YYYY-MM-DD
        
        let endPoint = AppConstants.baseURL + "calendar/reservations?\(host)&include=guest&start_date=\(startDate)&end_date=\(endDate)"
        
        let url = URL(string: endPoint)!
        
        let token = UserDefaults.standard.value(forKey: "m_token") as? String ?? "notoken"
        print("NS user default token: \(token)")
        var request = URLRequest(url: url)
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        //request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = "GET"

      
        URLSession.shared.dataTask(with: request) { (data, response , error) in
            
            if let _ = error {
                print(error!.localizedDescription)
                completion(nil, "Check internet connection")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil, "Invalid request")
                return 
            }
            
            guard let data = data else { return }
            //print(String(data: data, encoding: .utf8) ?? "Invalid JSON")
            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let reservations = try jsonDecoder.decode(Reservation.self, from: data)
                completion(reservations, nil)
                print(reservations)
            }catch {
                completion(nil, "Error occured")
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
}
