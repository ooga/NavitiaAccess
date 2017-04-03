//
//  JourneySummaryTableViewCell.swift
//  Pods
//
//  Created by Johan Rouve on 29/03/2017.
//
//

import UIKit

class JourneySummaryTableViewCell: UITableViewCell {

    // MARK: Properties
    @IBOutlet weak var JourneyLabel: UILabel!
    @IBOutlet weak var DurationLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func updateWith(_ journey: Journeys) {
        let durationMin = journey.duration! / 60
        self.JourneyLabel.text = journey.type
        self.DurationLabel.text = String(describing: Int(floor(Double(durationMin)))) + " min"
    }
}
