//
//  TeamDetails.swift
//  iSport
//
//  Created by Hadia Yehia on 30/05/2023.
//

import Foundation
struct TeamDetailsResponse : Decodable{
    var success : Int?
    var result : [TeamDetails]?
}
struct TeamDetails : Decodable{

    var team_name : String?
    var team_logo : String?
    var players : [Player]?
    var coaches : [Coach]?
}
struct Player : Decodable{
    var player_name : String?
    var player_type : String?
    var player_image : String?
    var player_match_played : String?
    var player_goals : String?
    init(player_name: String? = "", player_type: String? = "", player_image: String? = "", player_match_played: String? = "", player_goals: String? = "") {
        self.player_name = player_name
        self.player_type = player_type
        self.player_image = player_image
        self.player_match_played = player_match_played
        self.player_goals = player_goals
    }
}
struct Coach : Decodable{
    var coach_name : String?
}
