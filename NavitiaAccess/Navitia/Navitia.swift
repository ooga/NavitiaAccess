//
//  Navitia.swift
//  Pods
//
//  Created by Johan Rouve on 23/03/2017.
//
//
import Alamofire
import AlamofireObjectMapper
import ObjectMapper

public class Navitia {
    let baseUrl = "https://api.navitia.io/v1"
    var token = ""
    
    init(withConfig config: Dictionary<String, String>) {
        token = config["token"]!
    }
    
    public func getDepartures(callback: @escaping (DepartureResponse?, String?) -> Void) {
        let URL = baseUrl + "/coverage/sandbox/stop_areas/stop_area:OIF:SA:8768600/departures"
        Alamofire.request(URL)
            .authenticate(user: token, password: "")
            .validate()
            .responseObject { (response: DataResponse<DepartureResponse>) in
                switch response.result {
                case .success:
                    callback(response.result.value!, nil)
                case .failure(let error):
                    callback(nil, error.localizedDescription)
                }
        }
    }
    
    public func getPlaces(query: String, callback: @escaping (PlacesResponse?, String?) -> Void) {
        let URL = baseUrl + "/coverage/sandbox/places?q=" + query.replacingOccurrences(of: " ", with: "%20")
        print(URL)
        Alamofire.request(URL)
            .authenticate(user: token, password: "")
            .validate()
            .responseObject { (response: DataResponse<PlacesResponse>) in
                switch response.result {
                case .success:
                    callback(response.result.value!, nil)
                case .failure(let error):
                    callback(nil, error.localizedDescription)
                }
        }
    }
    
    public func getJourneys(from: String, to: String, callback: @escaping (JourneysResponse?, String?) -> Void) {
        let URL = baseUrl + "/coverage/sandbox/journeys?from=" + from + "&to=" + to + "&first_section_mode[]=bike&first_section_mode[]=walking&first_section_mode[]=car"
        print(URL)
        Alamofire.request(URL)
            .authenticate(user: token, password: "")
            .validate()
            .responseObject { (response: DataResponse<JourneysResponse>) in
                switch response.result {
                case .success:
                    callback(response.result.value!, nil)
                case .failure(let error):
                    callback(nil, error.localizedDescription)
                }
        }
    }
}
