//
//  FavouriteViewController.swift
//  iSport
//
//  Created by Hadia Yehia on 01/06/2023.
//

import UIKit

class FavouriteViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
 
    

    @IBOutlet weak var favTable: UITableView!
    let viewModel = FavViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        favTable.delegate = self
        favTable.dataSource = self
        bindViewModel()

    }
    override func viewDidAppear(_ animated: Bool) {
        viewModel.getFav()
        favTable.reloadData()
    }
    func bindViewModel() {
//        viewModel.isLoading.bind {[weak self] isLoading in
//            guard let self = self , let isLoading = isLoading else{
//                return
//            }
//            DispatchQueue.main.async {
//                if isLoading{
//                    self.allLeaguesActivityIndicator.startAnimating()
//                }else {
//                    self.reloadTableView()
//                    self.allLeaguesActivityIndicator.stopAnimating()
//                }
//            }
//
//        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getTableCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavTableViewCell", for: indexPath) as! FavTableViewCell
        cell.configCell(team: viewModel.getObjectForCell(index: indexPath.row))
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            viewModel.deleteTeam(index:indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    


}
