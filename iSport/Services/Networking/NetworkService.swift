//
//  NetworkService.swift
//  iSport
//
//  Created by Hadia Yehia on 21/05/2023.
//

import Foundation

class NetworkService{
    
    // All Leagues
    
    static func getAllLeagues (game:String ,completionHandler : @escaping(_ result: Result<AllLeagues?,NetworkError>) -> Void){
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
        let url = URL(string: NetworkConstants.shared.baseUrl + "football/?met=Fixtures&APIkey=" + NetworkConstants.shared.apiKey + "&from=2023-05-10&to=2023-05-23&leagueId=" + String(leagueKey))
        //let url = URL(string: NetworkConstants.shared.baseUrl + game + "/?met=Fixures&APIkey="+NetworkConstants.shared.apiKey + "&from=2023-05-10&to=2023-05-23&leagueId="+String(leagueKey))
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
                completionHandler(.success(result))
            }catch let error {
                print(error.localizedDescription)
                completionHandler(.failure(.canNotParseData))
            }
        }
        task.resume()
    }
    // All Players
    static func getPlayers(game:String, leagueKey : Int, completionHandler : @escaping(_ result: Result<AllPlayers?,NetworkError>) -> Void){
        let url = URL(string:NetworkConstants.shared.baseUrl + game + "/?&met=Players&APIkey=" + NetworkConstants.shared.apiKey + "&leagueId=" + String(leagueKey))
       // let url = URL(string: NetworkConstants.shared.baseUrl + game + "/?&met=Players&APIkey=" + NetworkConstants.shared.apiKey + "&leagueId=" + String(leagueKey))
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
                let result = try JSONDecoder().decode(AllPlayers.self, from: data)
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
                let result = try JSONDecoder().decode(TeamDetailsResponse.self, from: data)
                completionHandler(.success(result))
            }catch let error {
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
