//
//  FavTableViewCell.swift
//  iSport
//
//  Created by Hadia Yehia on 02/06/2023.
//

import UIKit

class FavTableViewCell: UITableViewCell {

    @IBOutlet weak var favImg: UIImageView!
    @IBOutlet weak var favLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
    func configCell(team : FavTeamData) {
        favLabel.text = team.name
        favImg.sd_setImage(with: URL(string: team.img), placeholderImage: UIImage(named: "pngegg"))
    }

}
