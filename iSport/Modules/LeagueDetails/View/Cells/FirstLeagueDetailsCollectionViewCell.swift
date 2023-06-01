//
//  FirstLeagueDetailsCollectionViewCell.swift
//  iSport
//
//  Created by Hadia Yehia on 25/05/2023.
//

import UIKit

class FirstLeagueDetailsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var firstImg: UIImageView!
    @IBOutlet weak var secondTeamName: UILabel!
    @IBOutlet weak var secondImg: UIImageView!
    @IBOutlet weak var firstTeamName: UILabel!
    
    func configCell (event : UpcomingEventsStruct){
        timeLabel.text = event.time
        dateLabel.text = event.date
        firstImg.sd_setImage(with: URL(string: event.firstTeamImg ?? ""),placeholderImage: UIImage(named: "pngegg"))
        secondImg.sd_setImage(with: URL(string: event.secondTeamImg ?? ""),placeholderImage: UIImage(named: "pngegg"))
        firstTeamName.text = event.firstTeamName
        secondTeamName.text = event.secondTeamName
    }
}
