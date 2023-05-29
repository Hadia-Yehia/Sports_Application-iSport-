//
//  AllTeams.swift
//  iSport
//
//  Created by Hadia Yehia on 29/05/2023.
//

import Foundation
struct AllTeams : Decodable{
    var success : Int?
    var result : [Team]?
    init(success: Int? = 0, result: [Team]? = Array<Team>()) {
        self.success = success
        self.result = result
    }
}
struct Team : Decodable{
    var team_key : Int?
    var team_logo : String?
    init(team_key: Int? = 0, team_logo: String? = "") {
        self.team_key = team_key
        self.team_logo = team_logo
    }
}
