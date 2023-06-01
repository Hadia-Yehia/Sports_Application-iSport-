//
//  PlayerTableViewCell.swift
//  iSport
//
//  Created by Hadia Yehia on 30/05/2023.
//

import UIKit

class PlayerTableViewCell: UITableViewCell {

    @IBOutlet weak var playerGoals: UILabel!
    @IBOutlet weak var playerMatches: UILabel!
    @IBOutlet weak var playerposition: UILabel!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var playerImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configCell(player : Player){
        playerGoals.text = player.player_goals
        playerName.text = player.player_name
        playerMatches.text = player.player_match_played
        playerposition.text = player.player_type
        playerImg.sd_setImage(with:URL(string: player.player_image ?? ""), placeholderImage: UIImage(named: "pngegg"))
    }
    
}
