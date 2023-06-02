//
//  ViewModel.swift
//  iSport
//
//  Created by Hadia Yehia on 23/05/2023.
//

import Foundation

class AllLeaguesViewModel{
    var isLoading : Observable<Bool> = Observable(value: false)

    var leagueForCell = AllLeaguesStruct(name: "", img: "")
    var dataSource: [League] = Array<League>()
    var filteredDataSource : [League] = Array<League>()
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
                self?.dataSource = data?.result ?? []
                self?.filteredDataSource = data?.result ?? []
            case .failure(let error):
                print("error\(error.localizedDescription)")
            }
        }
    }
    func search(searchText : String){
        if searchText.isEmpty == false{
            var resultPredicate = NSPredicate(format: "name contains[cd] %@", searchText);
            filteredDataSource = dataSource.filter{$0.league_name?.contains(searchText) ?? false}
           
               }
        else if searchText.isEmpty{
           filteredDataSource = dataSource
        }
    }
    

    func getObjectOfCell(index: Int)-> AllLeaguesStruct{
        
        leagueForCell.name = filteredDataSource[index].league_name
        leagueForCell.img = filteredDataSource[index].league_logo
        
        return leagueForCell
        
    }
    func getTableCount()-> Int{
        return filteredDataSource.count
    }
    func navigateToDetailsScreen(index : Int) -> LeagueDetailsViewModel {
        let leagueKey = filteredDataSource[index].league_key
        let game = self.game
        return LeagueDetailsViewModel(leaguesKey: leagueKey ?? 0,game: game ?? "")
    }
    
}

