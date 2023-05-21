//
//  NetworkService.swift
//  iSport
//
//  Created by Hadia Yehia on 21/05/2023.
//

import Foundation

class NetworkService{
    static func loadData (completitionHandler : @escaping (AllLeagues?)-> Void){
        let ApiKey = "189646bbcef43e15c53b76ffc1fd43c41aa763457c286c1ab939835928ffebda"
        let url = URL(string: "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey="+ApiKey)
        guard let urlFinal = url else{
            return
        }
        let request = URLRequest(url: url!)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: request){
            ( data, response, error) in
            
            guard let data = data else {
                return
            }
            do {
                let result = try JSONDecoder().decode(AllLeagues.self, from: data)
                completitionHandler(result)
            }catch let error {
                print(error.localizedDescription)
                completitionHandler(nil)
            }
        }
        task.resume()
    }
}
