//
//  LeagueDetails.swift
//  iSport
//
//  Created by Hadia Yehia on 28/05/2023.
//

import Foundation
struct EventsResponse : Decodable{
    var success : Int?
    var result : [Event]?
}
struct Event : Decodable{
    
       var event_home_team : String?
       var event_away_team : String?
       var home_team_logo : String?
       var away_team_logo : String?
       var event_final_result : String?
       var event_date : String?
       var event_time : String?
       var event_home_team_logo : String?
       var event_away_team_logo : String?
        var event_first_player_logo : String?
        var event_second_player_logo : String?
        var event_date_stop : String?
        var event_first_player : String?
        var event_second_player : String?
       var event_home_final_result : String?
       var event_away_final_result : String?
}


//struct FootballEvent : Decodable{
//    var event_date : String?
//    var event_time : String?
//    var event_home_team : String?
//    var event_away_team : String?
//    var home_team_logo : String?
//    var away_team_logo : String?
//    var event_final_result : String?
//}
//struct BasketballEvent : Decodable{
//    var event_date : String?
//    var event_time : String?
//    var event_home_team : String?
//    var event_away_team : String?
//    var event_home_team_logo : String?
//    var event_away_team_logo : String?
//    var event_final_result : String?
//
//
//}
//struct TennisEvent : Decodable{
//    var event_time : String?
//    var event_date : String?
//    var event_home_team : String?
//    var event_away_team : String?
//    var event_first_player_logo : String?
//    var event_second_player_logo : String?
//    var event_final_result : String?
//}
//struct CricketEvent : Decodable{
//    var event_time : String?
//    var event_date_stop : String?
//    var event_first_team : String?
//    var event_second_team : String?
//    var event_home_team_logo : String?
//    var event_away_team_logo : String?
//    var event_home_final_result : String?
//    var event_away_final_result : String?
//}
