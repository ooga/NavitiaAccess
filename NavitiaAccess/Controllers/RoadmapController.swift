//
//  RoadmapController.swift
//  Pods
//
//  Created by Johan Rouve on 29/03/2017.
//
//

import UIKit

class RoadmapController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var journey: Journeys?
    var sections: [Sections] = []
    var departureLabel: String?
    var destinationLabel: String?
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if (journey != nil) {
            for section in (journey!.sections)! {
                if section.type != "crow_fly" || section.duration != 0 {
                    self.sections.append(section)
                }
            }
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = getCell(sections: sections, indexPath: indexPath)
        
        cell!.updateWith(sections[indexPath.row])
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {}
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = getCell(sections: sections, indexPath: indexPath)
        
        return cell!.bounds.size.height
    }
    
    func getCell(sections: [Sections], indexPath: IndexPath) -> JourneySectionTableViewCell? {
        var cell:JourneySectionTableViewCell?
        var section:Sections = sections[indexPath.row]
        
        switch section.type! {
        case "public_transport":
            cell = self.tableView.dequeueReusableCell(withIdentifier: "PublicTransportSectionTableViewCell") as! PublicTransportSectionTableViewCell
            break
        case "transfer":
            cell = self.tableView.dequeueReusableCell(withIdentifier: "CrowFlySectionTableViewCell") as! CrowFlySectionTableViewCell
            break
        case "street_network":
            cell = self.tableView.dequeueReusableCell(withIdentifier: "CrowFlySectionTableViewCell") as! CrowFlySectionTableViewCell
            break
        case "crow_fly":
            cell = self.tableView.dequeueReusableCell(withIdentifier: "CrowFlySectionTableViewCell") as! CrowFlySectionTableViewCell
            break
        case "waiting":
            cell = self.tableView.dequeueReusableCell(withIdentifier: "WaitingSectionTableViewCell") as! WaitingSectionTableViewCell
            break
        case "park":
            cell = self.tableView.dequeueReusableCell(withIdentifier: "ParkSectionViewCell") as! ParkSectionViewCell
            break
        default:
            cell = self.tableView.dequeueReusableCell(withIdentifier: "PublicTransportSectionTableViewCell") as! PublicTransportSectionTableViewCell
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var label:String?
        if segue.identifier == "origin" {
            let sections = (journey!.sections)!
            label = sections[0].from!.name
        } else if segue.identifier == "destination" {
            let sections = (journey!.sections)!
            label = sections[sections.count - 1].to!.name
        }
        let destination = segue.destination as? SimplePlaceController
        destination?.label = label
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
