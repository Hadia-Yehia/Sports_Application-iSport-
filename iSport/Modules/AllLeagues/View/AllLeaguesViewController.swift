//
//  AllLeaguesViewController.swift
//  iSport
//
//  Created by Hadia Yehia on 22/05/2023.
//

import UIKit

class AllLeaguesViewController: UIViewController,UISearchBarDelegate{
   
    @IBOutlet weak var allLeaguesActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var allLeaguesTable: UITableView!
    @IBOutlet weak var allLeaguesSearchBar: UISearchBar!
    var game = ""
   // var gameLeagues = AllLeaguesStruct([])
    var viewModel = AllLeaguesViewModel()
    override func viewDidLoad() {
        
        super.viewDidLoad()
         setupTableView()
        bindViewModel()
        allLeaguesSearchBar.delegate = self
        viewModel.getData(game: game)
        

    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(searchText: searchText)
        allLeaguesTable.reloadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    func bindViewModel() {
        viewModel.isLoading.bind {[weak self] isLoading in
            guard let self = self , let isLoading = isLoading else{
                return
            }
            DispatchQueue.main.async {
                if isLoading{
                    self.allLeaguesActivityIndicator.startAnimating()
                }else {
                    self.reloadTableView()
                    self.allLeaguesActivityIndicator.stopAnimating()
                }
            }
            
        }
    }
    
  

}
