//
//  Journeys.swift
//
//  Created by Johan Rouve on 29/03/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct Journeys: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let durations = "durations"
    static let sections = "sections"
    static let type = "type"
    static let tags = "tags"
    static let calendars = "calendars"
    static let co2Emission = "co2_emission"
    static let status = "status"
    static let arrivalDateTime = "arrival_date_time"
    static let fare = "fare"
    static let departureDateTime = "departure_date_time"
    static let duration = "duration"
    static let nbTransfers = "nb_transfers"
    static let requestedDateTime = "requested_date_time"
  }

  // MARK: Properties
  public var durations: Durations?
  public var sections: [Sections]?
  public var type: String?
  public var tags: [String]?
  public var calendars: [Calendars]?
  public var co2Emission: Co2Emission?
  public var status: String?
  public var arrivalDateTime: String?
  public var fare: Fare?
  public var departureDateTime: String?
  public var duration: Int?
  public var nbTransfers: Int?
  public var requestedDateTime: String?

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
    durations <- map[SerializationKeys.durations]
    sections <- map[SerializationKeys.sections]
    type <- map[SerializationKeys.type]
    tags <- map[SerializationKeys.tags]
    calendars <- map[SerializationKeys.calendars]
    co2Emission <- map[SerializationKeys.co2Emission]
    status <- map[SerializationKeys.status]
    arrivalDateTime <- map[SerializationKeys.arrivalDateTime]
    fare <- map[SerializationKeys.fare]
    departureDateTime <- map[SerializationKeys.departureDateTime]
    duration <- map[SerializationKeys.duration]
    nbTransfers <- map[SerializationKeys.nbTransfers]
    requestedDateTime <- map[SerializationKeys.requestedDateTime]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = durations { dictionary[SerializationKeys.durations] = value.dictionaryRepresentation() }
    if let value = sections { dictionary[SerializationKeys.sections] = value.map { $0.dictionaryRepresentation() } }
    if let value = type { dictionary[SerializationKeys.type] = value }
    if let value = tags { dictionary[SerializationKeys.tags] = value }
    if let value = calendars { dictionary[SerializationKeys.calendars] = value.map { $0.dictionaryRepresentation() } }
    if let value = co2Emission { dictionary[SerializationKeys.co2Emission] = value.dictionaryRepresentation() }
    if let value = status { dictionary[SerializationKeys.status] = value }
    if let value = arrivalDateTime { dictionary[SerializationKeys.arrivalDateTime] = value }
    if let value = fare { dictionary[SerializationKeys.fare] = value.dictionaryRepresentation() }
    if let value = departureDateTime { dictionary[SerializationKeys.departureDateTime] = value }
    if let value = duration { dictionary[SerializationKeys.duration] = value }
    if let value = nbTransfers { dictionary[SerializationKeys.nbTransfers] = value }
    if let value = requestedDateTime { dictionary[SerializationKeys.requestedDateTime] = value }
    return dictionary
  }

}
