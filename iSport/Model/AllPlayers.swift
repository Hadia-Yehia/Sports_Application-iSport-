//
//  AllPlayers.swift
//  iSport
//
//  Created by Hadia Yehia on 05/06/2023.
//

import Foundation
struct AllPlayers : Decodable{
    var success : Int?
    var result : [TennisPlayer]?
    
}
struct TennisPlayer : Decodable{
    var player_name : String?
    var player_country : String?
    var player_logo : String?
    var player_bday : String?
    var stats :[stat]?
    var tournaments : [tournament]?
    init(player_name: String? = "No Data", player_country: String? = "No Data", player_logo: String? = "placeholder", player_bday: String? = "No Data", stats: [stat]? = [], tournaments: [tournament]? = []) {
        self.player_name = player_name
        self.player_country = player_country
        self.player_logo = player_logo
        self.player_bday = player_bday
        self.stats = stats
        self.tournaments = tournaments
    }
    
   
}
struct tournament : Decodable{
    var name : String?
    var season : String?
    init(name: String? = "No Data", season: String? = "No Data") {
        self.name = name
        self.season = season
    }
}
struct stat : Decodable{
    var season : String?
    var matches_won : String?
    var matches_lost : String?
    init(season: String? = "No Data", matches_won: String? = "No Data", matches_lost: String? = "No Data") {
        self.season = season
        self.matches_won = matches_won
        self.matches_lost = matches_lost
    }
}
