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
      
        //navigationController?.navigationBar.backgroundColor = .lightGray

    }
    override func viewDidAppear(_ animated: Bool) {
        viewModel.getFav()
        favTable.reloadData()
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
            let alert = UIAlertController(title: "Confirmation", message: "Are you sure you want to delete?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {_ in
                self.viewModel.deleteTeam(index:indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }) )
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if NetworkReachability.sharedInstance.check(){
            let teamDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "TeamDetailsViewController") as! TeamDetailsViewController
            teamDetailsVC.viewModel = self.viewModel.navigateToDetailsScreen(index: indexPath.row)
            self.navigationController?.pushViewController(teamDetailsVC, animated: true)
        }else {
            
            let alert = UIAlertController(title: "Network issue", message: "No connection", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
}


