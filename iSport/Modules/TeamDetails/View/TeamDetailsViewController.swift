//
//  TeamDetailsViewController.swift
//  iSport
//
//  Created by Hadia Yehia on 30/05/2023.
//

import UIKit

class TeamDetailsViewController: UIViewController {

    @IBOutlet weak var playersTable: UITableView!
    @IBOutlet weak var teamCoach: UILabel!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamImg: UIImageView!
    var viewModel : TeamDetailsViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        setupTableView()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel?.getTeamDetails()
        
        
    }
    func bindViewModel() {
        viewModel?.isLoading.bind {[weak self] isLoading in
            guard let self = self , let isLoading = isLoading else{
                return
            }
            DispatchQueue.main.async {
                if isLoading{
                   // self.allLeaguesActivityIndicator.startAnimating()
                }else {
                    self.reloadTableView()
                    self.teamName.text = self.viewModel?.getTeamName()
                    self.teamCoach.text = self.viewModel?.getCoachName()
                    self.teamImg.sd_setImage(with: URL(string: self.viewModel?.getTeamLogo() ?? ""), placeholderImage: UIImage(named: "pngegg"))
                   // self.allLeaguesActivityIndicator.stopAnimating()
                }
            }
            
        }
    }
    


}
