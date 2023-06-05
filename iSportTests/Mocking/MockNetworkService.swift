//
//  MockNetworkService.swift
//  iSportTests
//
//  Created by Hadia Yehia on 05/06/2023.
//

import Foundation
@testable import iSport
class MockNetworkService : Mockable{
    var shouldReturnError : Bool
    init(shouldReturnError: Bool) {
        self.shouldReturnError = shouldReturnError
    }
    let mockUpComingEvent = """
      {
          "success": 1,
          "result": [
       {
         "event_key": 12345,
         "event_date": "2023-05-30",
         "event_time": "18:00",
         "event_home_team": "Home Team",
         "event_away_team": "Away Team",
         "home_team_logo": "https://example.com/home_team_logo.png",
         "away_team_logo": "https://example.com/away_team_logo.png",
         "event_final_result": "3-2"
       }
      ]
  }
  """
    let mockTeamDetails = """

{
  "success": 1,
  "result": [
    {
      "team_key": 4,
      "team_name": "Wales",
      "team_logo": "https://apiv2.allsportsapi.com/logo/4_wales.jpg",
      "players": [
        {
          "player_key": 1465039677,
          "player_name": "A. Davies",
          "player_number": "",
          "player_country": null,
          "player_type": "Goalkeepers",
          "player_age": "30",
          "player_match_played": "0",
          "player_goals": "0",
          "player_yellow_cards": "0",
          "player_red_cards": "0",
          "player_image": "https://apiv2.allsportsapi.com/logo/players/32048_a-davies.jpg"
        }],
      "coaches": [
        {
          "coach_name": "R. Page",
          "coach_country": null,
          "coach_age": null
        }
      ]
    }
  ]
}
"""
    let mochAllPlayers = """
{
  "success": 1,
  "result": [
    {
      "player_key": 1056,
      "player_name": "A. Martin",
      "player_country": "USA",
      "player_bday": "07.07.2001",
      "player_logo": "https://apiv2.allsportsapi.com/logo-tennis/1056_a-martin.jpg",
      "stats": [
        {
          "season": "2022",
          "type": "doubles",
          "rank": "",
          "titles": "0",
          "matches_won": "0",
          "matches_lost": "2",
          "hard_won": "0",
          "hard_lost": "2",
          "clay_won": "",
          "clay_lost": "",
          "grass_won": "",
          "grass_lost": ""
        }],
"tournaments": [
        {
          "name": "Losinj (Challenger)",
          "season": "2021",
          "type": "doubles",
          "surface": "clay",
          "prize": "$75,000"
        }
]
    }
  ]
}
"""
    

    func getAllLeagues (game:String ,completionHandler : @escaping(_ result: Result<AllLeagues?,NetworkError>) -> Void){
        if shouldReturnError{
            completionHandler(.failure(.urlError))
        }
        else{
            do {
                let result = try loadJSON(filename: "AllLeaguesData", type: AllLeagues.self)
                
                completionHandler(.success(result))
            }catch let error {
                print(error.localizedDescription)
                completionHandler(.failure(.canNotParseData))
                
            }
        }
    }
    func getTeamDetails(game:String, teamId : Int, completionHandler : @escaping(_ result: Result<TeamDetailsResponse?,NetworkError>) -> Void){
        if shouldReturnError{
            completionHandler(.failure(.urlError))
        }else{
            do{
                if let myData = mockTeamDetails.data(using: .utf8){
                    do{
                        let result = try JSONDecoder().decode(TeamDetailsResponse.self, from: myData)
                        completionHandler(.success(result))}}
            }catch let error{
                print(error.localizedDescription)
                completionHandler(.failure(.canNotParseData))
            }
        }
    }
    func getDataOfUpComingEvents(game:String, leagueKey : Int, completionHandler : @escaping(_ result: Result<EventsResponse?,NetworkError>) -> Void){
        if shouldReturnError{
            completionHandler(.failure(.urlError))
        }
        else{
            do {
                if let myData = mockUpComingEvent.data(using: .utf8){
                    do{
                        let result = try JSONDecoder().decode(EventsResponse.self, from: myData)
                        completionHandler(.success(result))}}
            }catch let error {
                print(error.localizedDescription)
                completionHandler(.failure(.canNotParseData))
                
            }
        }
    }
    func getPlayers(game:String, leagueKey : Int, completionHandler : @escaping(_ result: Result<AllPlayers?,NetworkError>) -> Void){
        if shouldReturnError{
            completionHandler(.failure(.urlError))
        }
        else{
            do{
                if let myData = mochAllPlayers.data(using: .utf8){
                    do{
                        let result = try JSONDecoder().decode(AllPlayers.self, from: myData)
                        completionHandler(.success(result))}}
            }catch let error {
                print(error.localizedDescription)
                completionHandler(.failure(.canNotParseData))
                
            
            }
        }
    }
    
}

