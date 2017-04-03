//
//  WaitingSectionTableViewCell.swift
//  Pods
//
//  Created by Johan Rouve on 31/03/2017.
//
//

import UIKit

class WaitingSectionTableViewCell: JourneySectionTableViewCell {

    @IBOutlet weak var waitingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func updateWith(_ section: Sections) {
        let minutesWaiting = floorf(Float(section.duration!) / 60)
        let format = minutesWaiting > 1 ? "Wait %0.0f minutes" : "Wait %0.0f minute"
        let label = String(format: format, arguments: [minutesWaiting])
        waitingLabel.text = label
    }

}
