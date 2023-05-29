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
    init(name: String? = "", img: String? = "") {
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
    init(date: String? = "", time: String? = "", firstTeamName: String? = "", secondTeamName: String? = "", firstTeamImg: String? = "", secondTeamImg: String? = "") {
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
        init(date: String? = "", time: String? = "", firstTeamName: String? = "", secondTeamName: String? = "", firstTeamImg: String? = "", secondTeamImg: String? = "", result: String? = "") {
            self.date = date
            self.time = time
            self.firstTeamName = firstTeamName
            self.secondTeamName = secondTeamName
            self.firstTeamImg = firstTeamImg
            self.secondTeamImg = secondTeamImg
            self.result = result
        }
        
}