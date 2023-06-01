//
//  NetworkService.swift
//  iSport
//
//  Created by Hadia Yehia on 21/05/2023.
//

import Foundation

class NetworkService{
    
    // All Leagues
    
    static func loadDataFromApi (game:String ,completionHandler : @escaping(_ result: Result<AllLeagues?,NetworkError>) -> Void){
    
        let url = URL(string: NetworkConstants.shared.baseUrl+game+"/?met=Leagues&APIkey="+NetworkConstants.shared.apiKey)
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
               
                completionHandler(.success(result))
            }catch let error {
                print(error.localizedDescription)
                completionHandler(.failure(.canNotParseData))
      
            }
        }
        task.resume()
    }
    
    // Upcoming Events
    
    static func getDataOfUpComingEvents(game:String, leagueKey : Int, completionHandler : @escaping(_ result: Result<EventsResponse?,NetworkError>) -> Void){
        let url = URL(string: NetworkConstants.shared.baseUrl+game+"/?met=Fixtures&leagueId="+String(leagueKey)+"&from=2023-05-09&to=2024-02-09&APIkey="+NetworkConstants.shared.apiKey)
        
        
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
                let result = try JSONDecoder().decode(EventsResponse.self, from: data)
                print("upcoming network" + (result.result?.first?.event_final_result ?? "hadiaaaaa"))
                completionHandler(.success(result))
            }catch let error {
                print(error.localizedDescription)
                completionHandler(.failure(.canNotParseData))
               
            }
        }
        task.resume()
        
    
    }
    
    //  Latest Events
    
    static func getDataOfLatestEvents(game:String, leagueKey : Int, completionHandler : @escaping(_ result: Result<EventsResponse?,NetworkError>) -> Void){
        let url = URL(string: NetworkConstants.shared.baseUrl + game + "/?met=Fixtures&APIkey="+NetworkConstants.shared.apiKey + "&from=2023-05-10&to=2023-05-23&leagueId="+String(leagueKey))
        
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
                let result = try JSONDecoder().decode(EventsResponse.self, from: data)
                print("latest network" + (result.result?.first?.event_final_result ?? "hadiaaaaa"))
                completionHandler(.success(result))
            }catch let error {
                print(error.localizedDescription)
                completionHandler(.failure(.canNotParseData))
               
            }
        }
        task.resume()
    }
    
    // All Teams
    
    static func getTeams(game:String, leagueKey : Int, completionHandler : @escaping(_ result: Result<AllTeams?,NetworkError>) -> Void){
        let url = URL(string: NetworkConstants.shared.baseUrl + game + "/?met=Teams&?met=Leagues&leagueId="+String(leagueKey)+"&APIkey=" + NetworkConstants.shared.apiKey)
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
                let result = try JSONDecoder().decode(AllTeams.self, from: data)
                print("teams network" + (result.result?.first?.team_logo ?? "hadiaaaaa"))
                completionHandler(.success(result))
            }catch let error {
                print(error.localizedDescription)
                completionHandler(.failure(.canNotParseData))
            }
        }
        task.resume()
    }
    
    //TeamDetails
    static func getTeamDetails(game:String, teamId : Int, completionHandler : @escaping(_ result: Result<TeamDetailsResponse?,NetworkError>) -> Void){
        let url = URL(string:NetworkConstants.shared.baseUrl + game + "/?met=Teams&teamId=" + String(teamId) + "&APIkey=" + NetworkConstants.shared.apiKey)
        guard let urlFinal = url else{
            print("yousra url")
            completionHandler(.failure(.urlError))
            return
        }
        let request = URLRequest(url: urlFinal)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request){
            ( data, response, error) in
           guard let data = data else {
               print("yousra data")
                return
            }
            do {
                let result = try JSONDecoder().decode(TeamDetailsResponse.self, from: data)
                print("teams network" + (result.result?.first?.team_name ?? "hadiaaaaa"))
                completionHandler(.success(result))
            }catch let error {
                print("yousra parse")
                print(error.localizedDescription)
                completionHandler(.failure(.canNotParseData))
            }
        }
        task.resume()
    }

    
}
enum NetworkError : Error{
    case urlError
    case canNotParseData
}

//



//https://apiv2.allsportsapi.com/football/?met=Teams&teamId=72&APIkey=189646bbcef43e15c53b76ffc1fd43c41aa763457c286c1ab939835928ffebda
//all leagues
//https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=189646bbcef43e15c53b76ffc1fd43c41aa763457c286c1ab939835928ffebda

//gwtUpcoming
//https://apiv2.allsportsapi.com/football/?met=Fixtures&leagueId=4&from=2023-05-09&to=2024-02-09&APIkey=189646bbcef43e15c53b76ffc1fd43c41aa763457c286c1ab939835928ffebda

////getLatestEvents
// let url = "\(BASE_URL)\(sportType)/?met=Fixtures&APIkey=\(API_KEY)&from=2023-05-10&to=2023-05-23&leagueId=\(leagueId)"
//https://apiv2.allsportsapi.com/football/?met=Fixtures&APIkey=189646bbcef43e15c53b76ffc1fd43c41aa763457c286c1ab939835928ffebda&from=2023-05-10&to=2023-05-23&leagueId=4
//
// //get teams
//https://apiv2.allsportsapi.com/football/?met=Teams&?met=Leagues&leagueId=4&APIkey=189646bbcef43e15c53b76ffc1fd43c41aa763457c286c1ab939835928ffebda
// let url = "\(BASE_URL)\(sportType)/?met=Teams&?met=Leagues&leagueId=\(leagueId)&APIkey=\(API_KEY)"
//
// /get teams Details
// let url = "\(BASE_URL)football/?&met=Teams&teamId=\(teamId)&APIkey=\(K.API_KEY)"

//
