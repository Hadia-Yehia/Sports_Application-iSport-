//
//  AllLeaguesViewController+TableView.swift
//  iSport
//
//  Created by Hadia Yehia on 23/05/2023.
//

import Foundation
import UIKit

extension AllLeaguesViewController : UITableViewDelegate,UITableViewDataSource{
    func setupTableView(){
        self.allLeaguesTable.dataSource = self
        self.allLeaguesTable.delegate = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameLeagues.names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "allleaguescell") as! AllLeaguesCell
        cell.allLeaguesCellLabel.text = gameLeagues.names[indexPath.row]
        cell.allLeaguesCellImg.image = UIImage(named: "pngegg")
        cell.allLeaguesCellImg.backgroundColor = UIColor.lightGray
        cell.allLeaguesCellImg.layer.borderWidth = 1
        cell.allLeaguesCellImg.layer.masksToBounds = false
        cell.allLeaguesCellImg.layer.borderColor = UIColor.black.cgColor
        cell.allLeaguesCellImg.layer.cornerRadius = cell.allLeaguesCellImg.frame.height/2
        cell.allLeaguesCellImg.clipsToBounds = true
        

        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func reloadTableView(){
        DispatchQueue.main.async {
            self.allLeaguesTable.reloadData()
        }
    }
    
}
