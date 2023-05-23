//
//  AllLeaguesViewController.swift
//  iSport
//
//  Created by Hadia Yehia on 22/05/2023.
//

import UIKit

class AllLeaguesViewController: UIViewController{
   
    @IBOutlet weak var allLeaguesActivityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var allLeaguesTable: UITableView!
    @IBOutlet weak var allLeaguesSearchBar: UISearchBar!
    var game = ""
    var gameLeagues = AllLeaguesStruct([])
    var viewModel = ViewModel()
    override func viewDidLoad() {
        
        super.viewDidLoad()
         setupTableView()
        bindViewModel()
        

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData(game: game)
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
                    self.allLeaguesActivityIndicator.stopAnimating()
                }
            }
            
        }
        viewModel.cellDataSource.bind {[weak self] leagues in
            guard let self = self, let leagues = leagues else {
                return
            }
            self.gameLeagues = leagues
            self.reloadTableView()
            
        }
    }
  

}
