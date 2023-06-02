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
    var favCell = FavTeamData(img: "", name: "", key: 0)
    func getFav(){
       dataSource = FavDatabase.fetchTeamsFromDataBase()
    }
    
    func getTableCount()-> Int{
        return dataSource?.count ?? 0
    }
    func getObjectForCell(index:Int)->FavTeamData{
        favCell.img = dataSource?[index].img ?? ""
        favCell.name = dataSource?[index].name ?? ""
        favCell.key = dataSource?[index].key ?? 0
        return favCell
    }
    func deleteTeam(index : Int){
        FavDatabase.deleteTeam(key: dataSource?[index].key ?? 0)
        dataSource?.remove(at: index)
    }
}
