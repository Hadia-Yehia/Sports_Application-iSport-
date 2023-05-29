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
            return "189646bbcef43e15c53b76ffc1fd43c41aa763457c286c1ab939835928ffebda"
        }
    }
    public var baseUrl : String{
        get{
            return "https://apiv2.allsportsapi.com/"
        }
    }
    
}
