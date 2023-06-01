//
//  ViewModel.swift
//  iSport
//
//  Created by Hadia Yehia on 28/05/2023.
//

import Foundation
class LeagueDetailsViewModel{
    var isLoading : Observable<Int> = Observable(value: 0)
    var leaguesKey : Int
    var game : String
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
            self?.isLoading.value = self?.load
            
            switch result{
            case .success(let data):
                self?.upcomingDataSource = data?.result ?? []
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
        case "tennis":
            latest = LatestEventsStruct(date: obj.event_date,time: obj.event_time, firstTeamName: obj.event_first_player, secondTeamName: obj.event_second_player,firstTeamImg:obj.event_first_player_logo,secondTeamImg: obj.event_second_player_logo,result: obj.event_final_result)
            break
        case "cricket":
            latest = LatestEventsStruct(date: obj.event_date_stop,time: obj.event_time, firstTeamName: obj.event_home_team, secondTeamName: obj.event_away_team,firstTeamImg:obj.event_home_team_logo,secondTeamImg: obj.event_away_team_logo,result: "\(String(describing: obj.event_home_final_result))-\( String(describing: obj.event_away_final_result))")
            break
            
        default:
            latest = LatestEventsStruct(date : "No Data", time: "No Data",firstTeamName: "No Data",secondTeamName: "No Data",firstTeamImg: "",secondTeamImg: "",result: "No Data")
        }
        return latest ??  LatestEventsStruct(date : "No Data", time: "No Data",firstTeamName: "No Data",secondTeamName: "No Data",firstTeamImg: "",secondTeamImg: "",result: "No Data")
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
        case "tennis":
            upcoming = UpcomingEventsStruct(date: obj.event_date,time: obj.event_time, firstTeamName: obj.event_first_player, secondTeamName: obj.event_second_player,firstTeamImg:obj.event_first_player_logo,secondTeamImg: obj.event_second_player_logo)
            break
        case "cricket":
            upcoming = UpcomingEventsStruct(date: obj.event_date_stop,time: obj.event_time, firstTeamName: obj.event_home_team, secondTeamName: obj.event_away_team,firstTeamImg:obj.event_home_team_logo,secondTeamImg: obj.event_away_team_logo)
            break
            
        default:
            upcoming = UpcomingEventsStruct(date : "No Data", time: "No Data",firstTeamName: "No Data",secondTeamName: "No Data",firstTeamImg: "",secondTeamImg: "")
        }
        return upcoming ??  UpcomingEventsStruct(date : "No Data", time: "No Data",firstTeamName: "No Data",secondTeamName: "No Data",firstTeamImg: "",secondTeamImg: "")
    }
    func getDataOfSecondCollectionCell(index : Int) -> String{
        return allTeamsDataSource[index].team_logo ?? ""
    }
    func navigateToDetailsScreen(index : Int) -> TeamDetailsViewModel {
        let teamID = allTeamsDataSource[index].team_key
        let game = self.game
        return TeamDetailsViewModel(teamID: teamID ?? 0 , game: game)
        
    }
    
}
