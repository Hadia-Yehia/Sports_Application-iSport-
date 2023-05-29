//
//  ViewModel.swift
//  iSport
//
//  Created by Hadia Yehia on 23/05/2023.
//

import Foundation

class ViewModel{
    var isLoading : Observable<Bool> = Observable(value: false)

    var leagueForCell = AllLeaguesStruct(name: "", img: "")
    var dataSource: [League] = Array<League>()
    var game : String?
    
    func getData(game:String){
        if isLoading.value ?? true{
            return
        }
        isLoading.value = true
        NetworkService.loadDataFromApi(game: game){[weak self] result in
            self?.isLoading.value = false
            switch result{
            case .success(let data):
                self?.game = game
                print("leagues\(data?.result?.first?.league_key ?? 0)")
                self?.dataSource = data?.result ?? []
            case .failure(let error):
                print("error\(error.localizedDescription)")
            }
        }
    }
    

    func getObjectOfCell(index: Int)-> AllLeaguesStruct{
        
        leagueForCell.name = dataSource[index].league_name
        leagueForCell.img = dataSource[index].league_logo
        
        return leagueForCell
        
    }
    func getTableCount()-> Int{
        return dataSource.count
    }
    func navigateToDetailsScreen(index : Int) -> LeagueDetailsViewModel {
        let leagueKey = dataSource[index].league_key
        let game = self.game
        return LeagueDetailsViewModel(leaguesKey: leagueKey ?? 0,game: game ?? "")
    }
    
}

