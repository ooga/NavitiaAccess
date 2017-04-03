//
//  StopDateTime.swift
//
//  Created by Johan Rouve on 23/03/2017
//  Copyright (c) Kisio. All rights reserved.
//

import Foundation
import ObjectMapper

public struct StopDateTime: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let arrivalDateTime = "arrival_date_time"
    static let dataFreshness = "data_freshness"
    static let additionalInformations = "additional_informations"
    static let departureDateTime = "departure_date_time"
    static let baseDepartureDateTime = "base_departure_date_time"
    static let links = "links"
    static let baseArrivalDateTime = "base_arrival_date_time"
  }

  // MARK: Properties
  public var arrivalDateTime: String?
  public var dataFreshness: String?
  public var additionalInformations: [Any]?
  public var departureDateTime: String?
  public var baseDepartureDateTime: String?
  public var links: [Any]?
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
    dataFreshness <- map[SerializationKeys.dataFreshness]
    additionalInformations <- map[SerializationKeys.additionalInformations]
    departureDateTime <- map[SerializationKeys.departureDateTime]
    baseDepartureDateTime <- map[SerializationKeys.baseDepartureDateTime]
    links <- map[SerializationKeys.links]
    baseArrivalDateTime <- map[SerializationKeys.baseArrivalDateTime]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = arrivalDateTime { dictionary[SerializationKeys.arrivalDateTime] = value }
    if let value = dataFreshness { dictionary[SerializationKeys.dataFreshness] = value }
    if let value = additionalInformations { dictionary[SerializationKeys.additionalInformations] = value }
    if let value = departureDateTime { dictionary[SerializationKeys.departureDateTime] = value }
    if let value = baseDepartureDateTime { dictionary[SerializationKeys.baseDepartureDateTime] = value }
    if let value = links { dictionary[SerializationKeys.links] = value }
    if let value = baseArrivalDateTime { dictionary[SerializationKeys.baseArrivalDateTime] = value }
    return dictionary
  }

}
