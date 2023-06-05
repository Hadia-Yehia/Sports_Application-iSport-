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
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
        // Configure the view for the selected state
    }
    func configCell (event : LatestEventsStruct){
        timeLabel.text = event.time
        dateLabel.text = event.date
        firstImg.sd_setImage(with: URL(string: event.firstTeamImg ?? "placeholder"),placeholderImage: UIImage(named: "placeholder"))
        secondImg.sd_setImage(with: URL(string: event.secondTeamImg ?? "placeholder"),placeholderImage: UIImage(named: "placeholder"))
        firstTeamLabel.text = event.firstTeamName
        secondTeamLabel.text = event.secondTeamName
        result.text = event.result
    }

}
