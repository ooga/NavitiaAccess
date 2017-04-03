//
//  Departures.swift
//
//  Created by Johan Rouve on 23/03/2017
//  Copyright (c) Kisio. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Departures: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let stopPoint = "stop_point"
    static let stopDateTime = "stop_date_time"
    static let links = "links"
    static let route = "route"
    static let displayInformations = "display_informations"
  }

  // MARK: Properties
  public var stopPoint: StopPoint?
  public var stopDateTime: StopDateTime?
  public var links: [Links]?
  public var route: Route?
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
    stopPoint <- map[SerializationKeys.stopPoint]
    stopDateTime <- map[SerializationKeys.stopDateTime]
    links <- map[SerializationKeys.links]
    route <- map[SerializationKeys.route]
    displayInformations <- map[SerializationKeys.displayInformations]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = stopPoint { dictionary[SerializationKeys.stopPoint] = value.dictionaryRepresentation() }
    if let value = stopDateTime { dictionary[SerializationKeys.stopDateTime] = value.dictionaryRepresentation() }
    if let value = links { dictionary[SerializationKeys.links] = value.map { $0.dictionaryRepresentation() } }
    if let value = route { dictionary[SerializationKeys.route] = value.dictionaryRepresentation() }
    if let value = displayInformations { dictionary[SerializationKeys.displayInformations] = value.dictionaryRepresentation() }
    return dictionary
  }

}
