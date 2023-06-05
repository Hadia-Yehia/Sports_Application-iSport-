//
//  ViewStructs.swift
//  iSport
//
//  Created by Hadia Yehia on 26/05/2023.
//

import Foundation

struct AllLeaguesStruct {
    var name : String?
    var img : String?
    init(name: String = "No Data", img: String = "placeholder") {
        self.name = name
        self.img = img
    }
}

struct UpcomingEventsStruct {
    var date : String?
    var time : String?
    var firstTeamName : String?
    var secondTeamName : String?
    var firstTeamImg : String?
    var secondTeamImg : String?
    init(date: String? = "No Data", time: String? = "No Data", firstTeamName: String? = "No Data", secondTeamName: String? = "No Data", firstTeamImg: String? = "placeholder", secondTeamImg: String? = "placeholder") {
        self.date = date
        self.time = time
        self.firstTeamName = firstTeamName
        self.secondTeamName = secondTeamName
        self.firstTeamImg = firstTeamImg
        self.secondTeamImg = secondTeamImg
    }
}
    struct LatestEventsStruct {
        var date : String?
        var time : String?
        var firstTeamName : String?
        var secondTeamName : String?
        var firstTeamImg : String?
        var secondTeamImg : String?
        var result : String?
        init(date: String? = "No Data", time: String? = "No Data", firstTeamName: String? = "No Data", secondTeamName: String? = "No Data", firstTeamImg: String? = "placeholder", secondTeamImg: String? = "placeholder", result: String? = "No Data") {
            self.date = date
            self.time = time
            self.firstTeamName = firstTeamName
            self.secondTeamName = secondTeamName
            self.firstTeamImg = firstTeamImg
            self.secondTeamImg = secondTeamImg
            self.result = result
        }
        
        
}
//struct TeamDetailsStruct {
//    var img : String?
//    var name : String?
//    var coach : String?
//    init(img: String? = "", name: String? = "", coach: String? = "") {
//        self.img = img
//        self.name = name
//        self.coach = coach
//    }
//}
struct FavTeamData{
    var img : String
    var name : String
    var key : Int
    var game : String
    init(img: String, name: String, key: Int, game : String) {
        self.img = img
        self.name = name
        self.key = key
        self.game = game
    }
    }

