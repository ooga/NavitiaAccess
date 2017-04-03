//
//  JourneySectionTableViewCell.swift
//  Pods
//
//  Created by Johan Rouve on 30/03/2017.
//
//

import UIKit

class PublicTransportSectionTableViewCell: JourneySectionTableViewCell {

    @IBOutlet weak var modeIcon: UIImageView!
    @IBOutlet weak var linePath: UIView!
    @IBOutlet weak var depLinePath: UIView!
    @IBOutlet weak var arrLinePath: UIView!
    @IBOutlet var lineColor: UILabel!
    @IBOutlet var lineCode: UILabel!
    @IBOutlet var departureTime: UILabel!
    @IBOutlet var arrivalTime: UILabel!
    @IBOutlet var departureStop: UILabel!
    @IBOutlet var arrivalStop: UILabel!
    @IBOutlet var headsign: UILabel!
    @IBOutlet var direction: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public override func updateWith(_ section: Sections) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd'T'HHmmss"
        formatter.locale = Locale(identifier: "fr_FR")
        let departureDate = formatter.date(from: section.departureDateTime!)
        let arrivalDate = formatter.date(from: section.arrivalDateTime!)
        
        formatter.dateFormat = "hh':'mm"
        self.modeIcon.image = getSectionIcon(section)
        self.departureTime.text = formatter.string(from: departureDate!)
        self.arrivalTime.text = formatter.string(from: arrivalDate!)
        
        if section.displayInformations?.color != nil {
            self.linePath.backgroundColor = hexStringToUIColor(hex: (section.displayInformations?.color)!)
            self.depLinePath.backgroundColor = hexStringToUIColor(hex: (section.displayInformations?.color)!)
            self.arrLinePath.backgroundColor = hexStringToUIColor(hex: (section.displayInformations?.color)!)
            self.lineColor.backgroundColor = hexStringToUIColor(hex: (section.displayInformations?.color)!)
        }
        
        if section.displayInformations?.textColor != nil {
            self.lineCode.textColor = hexStringToUIColor(hex: (section.displayInformations?.textColor)!)
        }
        self.lineCode.text = section.displayInformations?.code
        
        self.departureStop.text = section.from?.name
        self.arrivalStop.text = section.to?.name
        self.headsign.text = section.displayInformations?.headsign
        if ((section.displayInformations?.direction) != nil) {
            self.direction.text = String(format: "Direction: %@", arguments: [(section.displayInformations?.direction)!])
        }
    }
    
    func getSectionIcon(_ section: Sections) -> UIImage? {
        var mode:String = "physical_mode:RapidTransit"
        for link:Links in section.links! {
            if link.type == "physical_mode" {
                mode = link.id!
            }
        }
        
        var imageName: String = "train"
        switch mode {
        case "physical_mode:RapidTransit":
            imageName = "train"
            break
        case "physical_mode:Train":
            imageName = "train"
            break
        case "physical_mode:Metro":
            imageName = "subway"
            break
        case "physical_mode:Bus":
            imageName = "bus"
            break
        case "physical_mode:Tramway":
            imageName = "tram"
            break
        case "physical_mode:Car":
            imageName = "car"
            break
        case "physical_mode:Bike":
            imageName = "bike"
            break
        case "physical_mode:BikeSharingService":
            imageName = "bike"
            break
        default:
            break
        }

        let bundle:Bundle = Bundle(identifier: "org.cocoapods.NavitiaAccess")!
        return UIImage(named: imageName, in: bundle, compatibleWith: nil)
    }
}
