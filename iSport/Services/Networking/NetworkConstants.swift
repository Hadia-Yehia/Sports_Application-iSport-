//
//  NetworkConstants.swift
//  iSport
//
//  Created by Hadia Yehia on 24/05/2023.
//

import Foundation
class NetworkConstants{
    public static var shared: NetworkConstants = NetworkConstants()
    private init() {}
    public var apiKey : String{
        get{
           return "6f2a3a0b146827d9a3b0cc4022db17aab2ee3dc8a0cd9eda0816090b7faad8a0"
           // return "189646bbcef43e15c53b76ffc1fd43c41aa763457c286c1ab939835928ffebda"
        }
    }
    public var baseUrl : String{
        get{
            return "https://apiv2.allsportsapi.com/"
        }
    }
    
}

//


//https://apiv2.allsportsapi.com/tennis/?&met=Players&APIkey=189646bbcef43e15c53b76ffc1fd43c41aa763457c286c1ab939835928ffebda&leagueId=2833
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
//https://apiv2.allsportsapi.com/football/?met=Teams&teamId=4&APIkey=189646bbcef43e15c53b76ffc1fd43c41aa763457c286c1ab939835928ffebda

//

