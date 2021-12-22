//
//  TokenManager.swift
//  Corporate-House-Management
//
//  Created by Mr Kes on 12/21/21.
//

import Foundation
import Alamofire

struct TokenResponse: Decodable {
    var accessToken: String
}

class TokenService {
    static let shared = TokenService()

    let client_id = ""
    let client_secret = ""
    
    let aclient_id = ""
    let aclient_secret = ""
    
    func requestToken(client_id: String,
                      client_secret: String,
                      userDefaultKey: String) {
        
        let getTokenPath:String = "https://auth.hospitable.com/oauth/token"
        let tokenParams = ["client_id": client_id,
                           "client_secret": client_secret,
                           "audience":"api.hospitable.com",
                           "grant_type":"client_credentials"]
        
        AF.request(getTokenPath, method: .post, parameters: tokenParams, encoder: JSONParameterEncoder.default).responseJSON { response in
            //debugPrint(response)
            //print(response)
            switch response.result {
            case .success(let data):
                if let users = data as? [String: Any] {
                    //print(users["access_token"] ?? "")
                    let token = users["access_token"] as! String
                    UserDefaults.standard.set(token, forKey: userDefaultKey)
                    UserDefaults.standard.synchronize()
                    print("Token User default added: \(token)")
                }
            case .failure(let error):
                print("Something went wrong: \(error)")
            }
        }
    }
    
}

public func delayWithSeconds(_ seconds: Double, completion: @escaping () -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
        completion()
    }
}
