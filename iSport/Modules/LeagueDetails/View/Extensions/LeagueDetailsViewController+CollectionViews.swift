//
//  LeagueDetailsViewController+CollectionViews.swift
//  iSport
//
//  Created by Hadia Yehia on 26/05/2023.
//

import Foundation
import UIKit

extension LeagueDetailsViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func setUpCollectionViews(){
        self.firstCollectionVIew.dataSource = self
        self.firstCollectionVIew.delegate = self
        self.secondCollectionVIew.dataSource = self
        self.secondCollectionVIew.delegate = self
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case firstCollectionVIew:
            return viewModel?.getFirstCollectionCount() ?? 0
        case secondCollectionVIew:
            return viewModel?.getSecondCollectionCount() ?? 0
        default:
            return 0
        }
        
    }
    func reloadCollectioViews(){
        DispatchQueue.main.async {
            self.firstCollectionVIew.reloadData()
            self.secondCollectionVIew.reloadData()
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView{
        case firstCollectionVIew:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "firstcell", for: indexPath) as! FirstLeagueDetailsCollectionViewCell
            cell.configCell(event: viewModel?.getDataOfFirstCollectionCell(index: indexPath.row) ?? UpcomingEventsStruct())
            designCell(cell: cell)
            makeImgRounded(image: cell.firstImg, radius: cell.firstImg.frame.height/2)
            makeImgRounded(image: cell.secondImg, radius: cell.secondImg.frame.height/2)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "secondcell", for: indexPath) as! SecondLeagueDetailsCollectionViewCell
            cell.configCell(logo: viewModel?.getDataOfSecondCollectionCell(index: indexPath.row) ?? "placeholder")
            designCell(cell: cell)
            makeImgRounded(image: cell.img, radius: cell.img.frame.height/2)
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView{
        case secondCollectionVIew:
            if NetworkReachability.sharedInstance.check(){
                if ((viewModel?.checkDetailsAvailability()) != false){
                    let teamDetailsVC = self.storyboard?.instantiateViewController(withIdentifier: "TeamDetailsViewController") as! TeamDetailsViewController
                    teamDetailsVC.viewModel = self.viewModel?.navigateToDetailsScreen(index: indexPath.row)
                    self.navigationController?.pushViewController(teamDetailsVC, animated: true)
                }
                else {
                    let alert = UIAlertController(title: "Sorry", message: "There is no details right now", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self.present(alert, animated: true, completion: nil)
                }
            }else {
                
                let alert = UIAlertController(title: "Network issue", message: "No connection", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true, completion: nil)
            }
            break
            default:
            break
        }
    }
    func makeImgRounded(image : UIImageView, radius:CGFloat){
        
        image.backgroundColor = UIColor.lightGray
        image.layer.borderWidth = 1
        image.layer.masksToBounds = false
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.cornerRadius = radius
        image.clipsToBounds = true
    }
   
    func designCell(cell : FirstLeagueDetailsCollectionViewCell){
        cell.layer.borderWidth = 1
        cell.layer.masksToBounds = false
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.cornerRadius = 40
        cell.clipsToBounds = true
    }
    func designCell(cell : SecondLeagueDetailsCollectionViewCell){
        cell.layer.borderWidth = 1
        cell.layer.masksToBounds = false
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.cornerRadius = 40
        cell.clipsToBounds = true
    }

}
