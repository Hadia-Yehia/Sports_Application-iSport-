//
//  TeamDetailsViewModel.swift
//  iSport
//
//  Created by Hadia Yehia on 30/05/2023.
//

import Foundation
class TeamDetailsViewModel{
    var isLoading : Observable<Bool> = Observable(value: false)
    var teamID : Int
    var game : String
    var dataSource : TeamDetails?
    init(teamID: Int, game: String) {
        self.teamID = teamID
        self.game = game
    }
    func getTeamDetails(){
            if isLoading.value ?? true{
                return
            }
            isLoading.value = true
        NetworkService.getTeamDetails(game: game, teamId: teamID){[weak self] result in
            self?.isLoading.value = false
            switch result{
            case .success(let data):
                self?.dataSource = data?.result?.first
                print (self?.teamID ?? -1)
                break
            case .failure(let error):
                print("error\(error.localizedDescription)")
                break
    }
        }
    }
    func saveTeam(){
        let team = FavTeamData(img: dataSource?.team_logo ?? "placeholder", name: dataSource?.team_name ?? "No Data", key: teamID, game: game)
        FavDatabase.saveTeamToDataBase(team:  team)
    }
    func getDataOfTableViewCell(index : Int) -> Player {
        guard let player = dataSource?.players?[index] else { return Player() }
        return player
    }
    func getTableCount() -> Int {
        return dataSource?.players?.count ?? 0
        
    }
    func getTeamName()->String{
        return dataSource?.team_name ?? "No Data"
    }
    func getTeamLogo() -> String{
        return dataSource?.team_logo ?? "placeholder"
    }
    func getCoachName() -> String{
        return dataSource?.coaches?.first?.coach_name ?? "No Data"
    }
}
