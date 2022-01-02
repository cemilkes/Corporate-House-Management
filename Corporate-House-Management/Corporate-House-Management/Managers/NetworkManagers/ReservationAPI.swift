//
//  NetworkManager.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/21/21.
//

import Foundation
class ReservationAPI {
    
    // API CALLS:
    
    // Also consider this (new tableview Configuration): https://www.youtube.com/watch?v=8xjkFkSpl1M&t=514
    
    //Diffable Data source(Collection + TableView), Function Call: NSURLSession regular, result type, combine
    
    //Reservations -> Used NSURLSession, regular tableView Data Loading(not diffable datasource)
    
    //Listings -> call function with Result type and diffable datasoure on collectionView (For May side)
    //Listings Id -> detail VC
    
    //Listings (For Angel side)
    //Listings By Id
    
    //Calendar -> get Calendar api from Listings page - Alamofire get request and regular collection view (maybe both table and collection view)
    
    //Request token -> Alamofire
    
    // May
    //Properties -> use Combine for calling networking and populating tableView (check udemy swiftUI - weather part - muhammad azam course)
    // https://www.youtube.com/watch?v=M2psX-JwHdE&t=3157s
    //Properties by ID -> populate detail VC
    
    //Angel
    //Properties ->
    //Properties by ID -> populate detail VC
    
    static let shared = ReservationAPI()
  
    let mayProperties: String = PropertyData.shared.getMayPropertiesNames()
    
    func getReservations(with startDate: String, endDate: String, host:String, page: Int, completion: @escaping (Reservation?, CHError?) -> Void ) {
        // dateformat YYYY-MM-DD
        
        let endPoint = AppConstants.baseURL + "calendar/reservations?\(host)&include=guest&start_date=\(startDate)&end_date=\(endDate)" + "&per_page=10&page=\(page)"
        
        guard let url = URL(string: endPoint) else {
            completion(nil, .invalidCredentials)
            return
        }
        
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
                completion(nil, .unableToComplete)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil, .invalidResponse)
                return 
            }
            
            guard let data = data else { return }
            //print(String(data: data, encoding: .utf8) ?? "Invalid JSON")
            do {
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                let reservations = try jsonDecoder.decode(Reservation.self, from: data)
                completion(reservations, nil)
                //print(reservations)
            }catch {
                completion(nil, .invalidData)
                //print(error.localizedDescription)
            }
            
        }.resume()
    }
    
}
