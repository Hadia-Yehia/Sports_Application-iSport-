//
//  FavViewModel.swift
//  iSport
//
//  Created by Hadia Yehia on 02/06/2023.
//

import Foundation

class FavViewModel{
    var dataSource : [FavTeamData]?
    var isLoading : Observable<Bool> = Observable(value: false)
    var favCell = FavTeamData(img: "placeholder", name: "No Data", key: 0 ,game: "No Data")
    func getFav(){
       dataSource = FavDatabase.fetchTeamsFromDataBase()
    }
    
    func getTableCount()-> Int{
        return dataSource?.count ?? 0
    }
    func getObjectForCell(index:Int)->FavTeamData{
        favCell.img = dataSource?[index].img ?? "placeholder"
        favCell.name = dataSource?[index].name ?? "No Data"
        favCell.key = dataSource?[index].key ?? 0
        favCell.game = dataSource?[index].game ?? "No Data"
        return favCell
    }
    func deleteTeam(index : Int){
        FavDatabase.deleteTeam(key: dataSource?[index].key ?? 0)
        dataSource?.remove(at: index)
    }
    func navigateToDetailsScreen(index : Int) -> TeamDetailsViewModel {
        let teamID = dataSource?[index].key
        let game = dataSource?[index].game
        return TeamDetailsViewModel(teamID: teamID ?? 0 , game: game ?? "No Data")
        
    }
}
