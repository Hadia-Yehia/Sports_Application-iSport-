//
//  LeagueDetailsViewController.swift
//  iSport
//
//  Created by Hadia Yehia on 25/05/2023.
//

import UIKit

class LeagueDetailsViewController: UIViewController {
    
    
    
    @IBOutlet weak var secondCollectionVIew: UICollectionView!
    @IBOutlet weak var tabelView: UITableView!
    @IBOutlet weak var firstCollectionVIew: UICollectionView!
    var viewModel : LeagueDetailsViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bindViewModel()
        setUpCollectionViews()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel?.getUpcomingEvents()
        viewModel?.getLatestEvents()
        viewModel?.getAllTeams()
    }
    func bindViewModel() {
        viewModel?.isLoading.bind {[weak self] isLoading in
            guard let self = self , let isLoading = isLoading else{
                return
            }
            print("henaa\(isLoading)")
            DispatchQueue.main.async {
                if isLoading == 3{
                    self.reloadTableView()
                    self.reloadCollectioViews()
                }else {
                   
                    
                }
            }
            
        }
    }
}
  
    


