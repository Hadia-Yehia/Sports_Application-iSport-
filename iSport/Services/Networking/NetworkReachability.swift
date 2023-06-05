//
//  NetworkReachability.swift
//  iSport
//
//  Created by Hadia Yehia on 02/06/2023.
//

import Foundation
import Reachability

class NetworkReachability: NSObject {
    var reachability: Reachability!
    static let sharedInstance: NetworkReachability = {
        return NetworkReachability()
    }()
    override init() {
        super.init()
        reachability = try? Reachability()
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
     func check()-> Bool{
       if reachability.connection != .unavailable{
            return true
        }
        return false
    }

   
}
