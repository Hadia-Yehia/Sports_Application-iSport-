//
//  TeamDetails+TableView.swift
//  iSport
//
//  Created by Hadia Yehia on 30/05/2023.
//

import Foundation
import UIKit
extension TeamDetailsViewController : UITableViewDelegate,UITableViewDataSource{
    func setupTableView(){
        playersTable.dataSource = self
        playersTable.delegate = self
        playersTable.register(UINib(nibName: "PlayerTableViewCell", bundle: nil),forCellReuseIdentifier: "PlayerTableViewCell")
    }
    func reloadTableView(){
        DispatchQueue.main.async {
            self.playersTable.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getTableCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerTableViewCell", for: indexPath) as! PlayerTableViewCell
        cell.configCell(player: viewModel?.getDataOfTableViewCell(index: indexPath.row) ?? Player())
        return cell
    }
    
    
}
