//
//  ParkSectionViewCell.swift
//  Pods
//
//  Created by Johan Rouve on 04/04/2017.
//
//

import UIKit

class ParkSectionViewCell: JourneySectionTableViewCell {

    @IBOutlet var destinationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func updateWith(_ section: Sections) {
        let label = String(format: "Park to %@", arguments: [(section.to?.name)!])
        destinationLabel.text = label    }

}
