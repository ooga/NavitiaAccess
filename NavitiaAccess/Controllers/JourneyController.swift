//
//  AutocompleteController.swift
//  navitia
//
//  Created by Johan Rouve on 23/03/2017.
//  Copyright © 2017 Johan Rouve. All rights reserved.
//

import UIKit

public class JourneyController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var journeys: [Journeys] = []
    public var from: String?
    public var to: String?
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let navitia = Navitia(withConfig: ["token": "a61f4cd8-3007-4557-9f4c-214969369cca"])
        print(from)
        print(to)
        if (from != nil && to != nil)  {
            navitia.getJourneys(from: from!, to: to!, callback: {journeysResponse, error in
                if error != nil {
                    print(error!)
                } else {
                    self.journeys = (journeysResponse?.journeys)!
                    self.tableView.reloadData()
                }
            })
        } else {
            print("missing parameters 'from' or 'to'")
        }
    }

    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.journeys.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:JourneySummaryTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "JourneySummaryTableViewCell") as! JourneySummaryTableViewCell
        
        cell.updateWith(self.journeys[indexPath.row])
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {}
    
    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  let destination = segue.destination as? RoadmapController,
            let journeyIndex = tableView.indexPathForSelectedRow?.row
        {
            destination.journey = self.journeys[journeyIndex]
        }
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
