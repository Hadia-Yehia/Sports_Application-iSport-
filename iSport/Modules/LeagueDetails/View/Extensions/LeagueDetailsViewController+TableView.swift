//
//  LeagueDetailsViewController+TableView.swift
//  iSport
//
//  Created by Hadia Yehia on 26/05/2023.
//

import Foundation
import UIKit
extension LeagueDetailsViewController : UITableViewDelegate, UITableViewDataSource{
    func setupTableView(){
        self.tabelView.dataSource = self
        self.tabelView.delegate = self
    }
    func reloadTableView(){
        DispatchQueue.main.async {
            self.tabelView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tabelView.frame.height/2.2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getTableCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tablecell", for: indexPath) as! LeagueDetailsTableViewCell
        cell.configCell(event: viewModel?.getDataOfTableCell(index: indexPath.row) ?? LatestEventsStruct())
        designTableCell(cell: cell)
        makeImgRounded(image: cell.firstImg, radius: cell.firstImg.frame.height/2)
        makeImgRounded(image: cell.secondImg, radius: cell.secondImg.frame.height/2)
        return cell
    }
    func designTableCell(cell : LeagueDetailsTableViewCell){
        cell.layer.borderWidth = 1
        cell.layer.masksToBounds = false
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.cornerRadius = 40
        cell.clipsToBounds = true
    }
}
