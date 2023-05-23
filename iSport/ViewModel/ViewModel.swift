//
//  ViewModel.swift
//  iSport
//
//  Created by Hadia Yehia on 23/05/2023.
//

import Foundation

class ViewModel{
    var isLoading : Observable<Bool> = Observable(value: false)
    var cellDataSource : Observable<AllLeaguesStruct> = Observable(value: nil)
    var dataSource: [League] = Array<League>()
    func getData(game:String){
        if isLoading.value ?? true{
            return
        }
        isLoading.value = true
        NetworkService.loadDataFromApi(game: game){[weak self] result in
            self?.isLoading.value = false
            switch result{
            case .success(let data):
                print("leagues\(data?.result?.count ?? 0)")
                self?.dataSource = data?.result ?? []
                
                    self?.mapToTableData()
                
                
            case .failure(let error):
                print("error\(error.localizedDescription)")
            }
        }
    }
    func mapToTableData(){
        cellDataSource.value = AllLeaguesStruct(dataSource)
    }
//   " func mapToTableData(){
//        for i in 0..<(dataSource?.count ?? 0){
//            cellDataSource.value?[i].name = dataSource?[i].league_name ?? "hadia"
//            cellDataSource.value?[i].img = dataSource?[i].league_logo ?? ""
//
//        }
//    }"
  
    
}
struct AllLeaguesStruct {
    var names = Array<String>()
    var imgs = Array<String>()
    init(_ leagues: [League]) {
        for league in leagues{
            names.append(league.league_name ?? "")
            imgs.append(league.league_logo ?? "")
        }
    }
}

