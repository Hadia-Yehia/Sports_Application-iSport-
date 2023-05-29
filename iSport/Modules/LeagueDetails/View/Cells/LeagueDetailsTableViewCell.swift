//
//  LeagueDetailsTableViewCell.swift
//  iSport
//
//  Created by Hadia Yehia on 25/05/2023.
//

import UIKit

class LeagueDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var secondTeamLabel: UILabel!
    @IBOutlet weak var firstTeamLabel: UILabel!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var secondImg: UIImageView!
    @IBOutlet weak var firstImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configCell (event : LatestEventsStruct){
        timeLabel.text = event.time
        dateLabel.text = event.date
        firstImg.image = UIImage(named: "pngegg")
        secondImg.image = UIImage(named: "pngegg")
        firstTeamLabel.text = event.firstTeamName
        secondTeamLabel.text = event.secondTeamName
        result.text = event.result
    }

}
