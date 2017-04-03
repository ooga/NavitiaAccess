//
//  Sections.swift
//
//  Created by Johan Rouve on 29/03/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct Sections: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let additionalInformations = "additional_informations"
    static let mode = "mode"
    static let to = "to"
    static let type = "type"
    static let geojson = "geojson"
    static let baseArrivalDateTime = "base_arrival_date_time"
    static let co2Emission = "co2_emission"
    static let arrivalDateTime = "arrival_date_time"
    static let stopDateTimes = "stop_date_times"
    static let id = "id"
    static let baseDepartureDateTime = "base_departure_date_time"
    static let from = "from"
    static let departureDateTime = "departure_date_time"
    static let links = "links"
    static let transferType = "transfer_type"
    static let duration = "duration"
    static let displayInformations = "display_informations"
  }

  // MARK: Properties
  public var additionalInformations: [String]?
  public var mode: String?
  public var to: To?
  public var type: String?
  public var geojson: Geojson?
  public var baseArrivalDateTime: String?
  public var co2Emission: Co2Emission?
  public var arrivalDateTime: String?
  public var stopDateTimes: [StopDateTimes]?
  public var id: String?
  public var baseDepartureDateTime: String?
  public var from: From?
  public var departureDateTime: String?
  public var links: [Links]?
  public var transferType: String?
  public var duration: Int?
  public var displayInformations: DisplayInformations?

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
    additionalInformations <- map[SerializationKeys.additionalInformations]
    mode <- map[SerializationKeys.mode]
    to <- map[SerializationKeys.to]
    type <- map[SerializationKeys.type]
    geojson <- map[SerializationKeys.geojson]
    baseArrivalDateTime <- map[SerializationKeys.baseArrivalDateTime]
    co2Emission <- map[SerializationKeys.co2Emission]
    arrivalDateTime <- map[SerializationKeys.arrivalDateTime]
    stopDateTimes <- map[SerializationKeys.stopDateTimes]
    id <- map[SerializationKeys.id]
    baseDepartureDateTime <- map[SerializationKeys.baseDepartureDateTime]
    from <- map[SerializationKeys.from]
    departureDateTime <- map[SerializationKeys.departureDateTime]
    links <- map[SerializationKeys.links]
    transferType <- map[SerializationKeys.transferType]
    duration <- map[SerializationKeys.duration]
    displayInformations <- map[SerializationKeys.displayInformations]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = additionalInformations { dictionary[SerializationKeys.additionalInformations] = value }
    if let value = mode { dictionary[SerializationKeys.mode] = value }
    if let value = to { dictionary[SerializationKeys.to] = value.dictionaryRepresentation() }
    if let value = type { dictionary[SerializationKeys.type] = value }
    if let value = geojson { dictionary[SerializationKeys.geojson] = value.dictionaryRepresentation() }
    if let value = baseArrivalDateTime { dictionary[SerializationKeys.baseArrivalDateTime] = value }
    if let value = co2Emission { dictionary[SerializationKeys.co2Emission] = value.dictionaryRepresentation() }
    if let value = arrivalDateTime { dictionary[SerializationKeys.arrivalDateTime] = value }
    if let value = stopDateTimes { dictionary[SerializationKeys.stopDateTimes] = value.map { $0.dictionaryRepresentation() } }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = baseDepartureDateTime { dictionary[SerializationKeys.baseDepartureDateTime] = value }
    if let value = from { dictionary[SerializationKeys.from] = value.dictionaryRepresentation() }
    if let value = departureDateTime { dictionary[SerializationKeys.departureDateTime] = value }
    if let value = links { dictionary[SerializationKeys.links] = value.map { $0.dictionaryRepresentation() } }
    if let value = transferType { dictionary[SerializationKeys.transferType] = value }
    if let value = duration { dictionary[SerializationKeys.duration] = value }
    if let value = displayInformations { dictionary[SerializationKeys.displayInformations] = value.dictionaryRepresentation() }
    return dictionary
  }

}
