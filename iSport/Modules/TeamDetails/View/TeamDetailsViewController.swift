//
//  TeamDetailsViewController.swift
//  iSport
//
//  Created by Hadia Yehia on 30/05/2023.
//

import UIKit

class TeamDetailsViewController: UIViewController {
    var valid : Bool = true
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
        guard let  validity = viewModel?.checkValidity() else{return}
        valid = validity
        if valid {
            favBtn.setImage(UIImage(systemName: "heart"), for: .normal)
        }else{
            favBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
        
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
                    self.teamImg.sd_setImage(with: URL(string: self.viewModel?.getTeamLogo() ?? ""), placeholderImage: UIImage(named: "placeholder"))
                   // self.allLeaguesActivityIndicator.stopAnimating()
                }
            }
            
        }
    }
    

    @IBOutlet weak var favBtn: UIButton!
    @IBAction func addToFav(_ sender: UIButton) {
        if valid{
            viewModel?.saveTeam()
            favBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
        else {
            let alert = UIAlertController(title: "DataBase message", message: "Already existed", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    
}

