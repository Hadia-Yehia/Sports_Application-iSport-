//
//  AllLeagues.swift
//  iSport
//
//  Created by Hadia Yehia on 21/05/2023.
//

import Foundation
class League : Decodable{
    var league_key : Int?
    var league_name : String?
    var country_key : Int?
    var country_name : String?
    var league_logo : String?
    var country_logo : String?
}
class AllLeagues : Decodable{
    var success : Int?
    var result : [League]?
}
