//
//  CrowFlySectionTableViewCell.swift
//  Pods
//
//  Created by Johan Rouve on 31/03/2017.
//
//

import UIKit

class CrowFlySectionTableViewCell: JourneySectionTableViewCell {

    @IBOutlet weak var destinationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func updateWith(_ section: Sections) {
        let label = String(format: "Go to %@", arguments: [(section.to?.name)!])
        destinationLabel.text = label
    }

}
