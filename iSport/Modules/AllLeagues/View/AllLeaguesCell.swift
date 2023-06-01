//
//  AllLeaguesTableViewCell.swift
//  iSport
//
//  Created by Hadia Yehia on 22/05/2023.
//

import UIKit
import SDWebImage

class AllLeaguesCell: UITableViewCell {

    @IBOutlet weak var allLeaguesCellLabel: UILabel!
    @IBOutlet weak var allLeaguesCellImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func configCell(league : AllLeaguesStruct){
        allLeaguesCellLabel.text = league.name
        allLeaguesCellImg.sd_setImage(with:URL(string: league.img ?? ""), placeholderImage: UIImage(named: "pngegg"))
        
    }
    
}
