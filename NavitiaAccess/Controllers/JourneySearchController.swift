//
//  JourneySearchControllerViewController.swift
//  Pods
//
//  Created by Johan Rouve on 03/04/2017.
//
//

import UIKit

class JourneySearchController: UIViewController {

    @IBOutlet var from: AutoCompleteTextField!
    @IBOutlet var to: AutoCompleteTextField!
    
    var navitia:Navitia?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navitia = Navitia(withConfig: ["token": "a61f4cd8-3007-4557-9f4c-214969369cca"])
        configureAutocompleteField(field: from)
        configureAutocompleteField(field: to)
    }
    
    func configureAutocompleteField(field: AutoCompleteTextField) -> Void {
        field.onTextChange = {[weak self] text in
            if !text.isEmpty{
                self?.navitia?.getPlaces(query: text, callback: {placesResponse, error in
                    if error != nil {
                        print(error!)
                    } else {
                        var placesLabels: [String] = []
                        if ((placesResponse?.places) != nil) {
                            field.autoCompleteDatas = (placesResponse?.places)!
                            for place in field.autoCompleteDatas {
                                placesLabels.append(place.name!)
                            }
                        }
                        
                        field.autoCompleteStrings = placesLabels
                    }
                })
            }
        }
        
        field.onSelect = {[weak self] text, indexpath in
            field.selectedDatas = field.autoCompleteDatas[indexpath.row]
        }
    }
    
    override public func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  let destination = segue.destination as? JourneyController,
            let fromValue = from.selectedDatas?.id,
            let toValue = to.selectedDatas?.id {
            destination.from = fromValue
            destination.to = toValue
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
