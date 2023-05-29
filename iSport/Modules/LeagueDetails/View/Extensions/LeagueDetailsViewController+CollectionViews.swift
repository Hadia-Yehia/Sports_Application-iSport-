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
            return 10
        default:
            return 0
        }
        
    }
    func reloadCollectioViews(){
        DispatchQueue.main.async {
            self.firstCollectionVIew.reloadData()
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
            cell.img.image = UIImage(named: "pngegg")
            makeImgRounded(image: cell.img, radius: cell.img.frame.height/2)
            return cell
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
}
