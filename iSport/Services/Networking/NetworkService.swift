//
//  NetworkService.swift
//  iSport
//
//  Created by Hadia Yehia on 21/05/2023.
//

import Foundation

class NetworkService{
    static func loadDataFromApi (game:String ,completionHandler : @escaping(_ result: Result<AllLeagues?,NetworkError>) -> Void){
        let ApiKey = "189646bbcef43e15c53b76ffc1fd43c41aa763457c286c1ab939835928ffebda"
        let url = URL(string: "https://apiv2.allsportsapi.com/"+game+"/?met=Leagues&APIkey="+ApiKey)
        guard let urlFinal = url else{
            completionHandler(.failure(.urlError))
            return
        }
        let request = URLRequest(url: urlFinal)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: request){
            ( data, response, error) in
            
           
           guard let data = data else {
                return
            }
            do {
                let result = try JSONDecoder().decode(AllLeagues.self, from: data)
                //completionHandler(result)
                completionHandler(.success(result))
            }catch let error {
                print(error.localizedDescription)
                completionHandler(.failure(.canNotParseData))
                //completionHandler(nil)
            }
        }
        task.resume()
    }
}
enum NetworkError : Error{
    case urlError
    case canNotParseData
}
