//
//  CrowFlySectionTableViewCell.swift
//  Pods
//
//  Created by Johan Rouve on 31/03/2017.
//
//

import UIKit

class CrowFlySectionTableViewCell: JourneySectionTableViewCell {

    @IBOutlet var destinationLabel: UILabel!
    @IBOutlet var icon: UIImageView!
    
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
        
        if (section.mode != nil) {
            if section.mode == "bike" {
                icon.image = UIImage(named: "bike", in: Bundle(for: JourneySectionTableViewCell.self), compatibleWith: nil)
            } else if section.mode == "car" {
                icon.image = UIImage(named: "car", in: Bundle(for: JourneySectionTableViewCell.self), compatibleWith: nil)
            }
        }
    }

}
