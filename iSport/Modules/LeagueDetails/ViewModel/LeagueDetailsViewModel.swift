//
//  ViewModel.swift
//  iSport
//
//  Created by Hadia Yehia on 28/05/2023.
//

import Foundation
class LeagueDetailsViewModel{
    var isLoading : Observable<Int> = Observable(value: 0)
    var leaguesKey = 0
    var game = ""
    var load = 0
    var upcoming : UpcomingEventsStruct?
    var latest : LatestEventsStruct?
    var allTeamsDataSource : [Team] = Array<Team>()
    var latestDataSource : [Event] = Array<Event>()
    var upcomingDataSource : [Event] = Array<Event>()
    init(leaguesKey: Int , game: String) {
        self.leaguesKey = leaguesKey
        self.game = game
    }
    func getUpcomingEvents(){
//        if isLoading.value ?? true{
//            return
//        }
//        isLoading.value = true
        NetworkService.getDataOfUpComingEvents(game: self.game , leagueKey: self.leaguesKey){[weak self] result in
            //self?.isLoading.value = false
            self?.load += 1
            self?.isLoading.value = 2
            
            switch result{
            case .success(let data):
                self?.upcomingDataSource = data?.result ?? []
                print(("hadia\(data?.result?.first?.event_home_team ?? "")"))
                break
            case .failure(let error):
                print("error\(error.localizedDescription)")
                break
            }
            
        }
    }
    func getLatestEvents(){
        NetworkService.getDataOfLatestEvents(game: self.game, leagueKey: self.leaguesKey){[weak self] result in
            self?.load += 1
            self?.isLoading.value = self?.load
            switch result{
            case .success(let data):
                self?.latestDataSource = data?.result ?? []
                print(("hadia\(data?.result?.first?.event_final_result ?? "")"))
                break
            case .failure(let error):
                print("error\(error.localizedDescription)")
                break
                
            }
            
        }
    }
    func getAllTeams(){
        NetworkService.getTeams(game: self.game, leagueKey: self.leaguesKey){[weak self] result in
            self?.load += 1
            self?.isLoading.value = self?.load
            switch result{
            case .success(let data):
                self?.allTeamsDataSource = data?.result ?? []
                print("hadia\(data?.result?.first?.team_logo ?? "")")
                break
            case .failure(let error):
                print("error\(error.localizedDescription)")
                break
                
            }
            
        }
    }
    
    func getTableCount()-> Int{
        return latestDataSource.count
    }
    func getFirstCollectionCount()-> Int{
        return upcomingDataSource.count
    }
    func getSecondCollectionCount() -> Int{
        return allTeamsDataSource.count
    }
    func getDataOfTableCell(index: Int ) -> LatestEventsStruct{
        let obj = latestDataSource[index]
        switch game {
        case "football":
            latest = LatestEventsStruct(date: obj.event_date,time: obj.event_time, firstTeamName: obj.event_home_team, secondTeamName: obj.event_away_team,firstTeamImg: obj.home_team_logo,secondTeamImg: obj.away_team_logo, result: obj.event_final_result)
             break
        case "basketball":
            latest = LatestEventsStruct(date: obj.event_date,time: obj.event_time, firstTeamName: obj.event_home_team, secondTeamName: obj.event_away_team,firstTeamImg:obj.event_home_team_logo,secondTeamImg: obj.event_away_team_logo,result: obj.event_final_result)
            break
            
        default:
            latest = LatestEventsStruct()
        }
        return latest ?? LatestEventsStruct()
    }
    
    
    func getDataOfFirstCollectionCell(index : Int) -> UpcomingEventsStruct{
        let obj = upcomingDataSource[index]
        switch game {
        case "football":
            upcoming = UpcomingEventsStruct(date: obj.event_date,time: obj.event_time, firstTeamName: obj.event_home_team, secondTeamName: obj.event_away_team,firstTeamImg: obj.home_team_logo,secondTeamImg: obj.away_team_logo)
             break
        case "basketball":
            upcoming = UpcomingEventsStruct(date: obj.event_date,time: obj.event_time, firstTeamName: obj.event_home_team, secondTeamName: obj.event_away_team,firstTeamImg:obj.event_home_team_logo,secondTeamImg: obj.event_away_team_logo)
            break
            
        default:
            upcoming = UpcomingEventsStruct()
        }
        return upcoming ?? UpcomingEventsStruct()
    }
    
}
