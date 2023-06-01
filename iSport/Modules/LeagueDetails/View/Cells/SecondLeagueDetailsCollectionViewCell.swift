//
//  SecondLeagueDetailsCollectionViewCell.swift
//  iSport
//
//  Created by Hadia Yehia on 25/05/2023.
//

import UIKit

class SecondLeagueDetailsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!
    
    func configCell(logo : String){
        img.sd_setImage(with: URL(string: logo),placeholderImage: UIImage(named: "pngegg"))
    }
}
