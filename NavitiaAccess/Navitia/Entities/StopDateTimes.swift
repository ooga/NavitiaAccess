//
//  StopDateTimes.swift
//
//  Created by Johan Rouve on 29/03/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct StopDateTimes: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let arrivalDateTime = "arrival_date_time"
    static let additionalInformations = "additional_informations"
    static let departureDateTime = "departure_date_time"
    static let stopPoint = "stop_point"
    static let links = "links"
    static let baseDepartureDateTime = "base_departure_date_time"
    static let baseArrivalDateTime = "base_arrival_date_time"
  }

  // MARK: Properties
  public var arrivalDateTime: String?
  public var additionalInformations: [Any]?
  public var departureDateTime: String?
  public var stopPoint: StopPoint?
  public var links: [Any]?
  public var baseDepartureDateTime: String?
  public var baseArrivalDateTime: String?

  // MARK: ObjectMapper Initializers
  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public init?(map: Map){

  }

  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public mutating func mapping(map: Map) {
    arrivalDateTime <- map[SerializationKeys.arrivalDateTime]
    additionalInformations <- map[SerializationKeys.additionalInformations]
    departureDateTime <- map[SerializationKeys.departureDateTime]
    stopPoint <- map[SerializationKeys.stopPoint]
    links <- map[SerializationKeys.links]
    baseDepartureDateTime <- map[SerializationKeys.baseDepartureDateTime]
    baseArrivalDateTime <- map[SerializationKeys.baseArrivalDateTime]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = arrivalDateTime { dictionary[SerializationKeys.arrivalDateTime] = value }
    if let value = additionalInformations { dictionary[SerializationKeys.additionalInformations] = value }
    if let value = departureDateTime { dictionary[SerializationKeys.departureDateTime] = value }
    if let value = stopPoint { dictionary[SerializationKeys.stopPoint] = value.dictionaryRepresentation() }
    if let value = links { dictionary[SerializationKeys.links] = value }
    if let value = baseDepartureDateTime { dictionary[SerializationKeys.baseDepartureDateTime] = value }
    if let value = baseArrivalDateTime { dictionary[SerializationKeys.baseArrivalDateTime] = value }
    return dictionary
  }

}
