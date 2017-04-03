//
//  StopArea.swift
//
//  Created by Johan Rouve on 23/03/2017
//  Copyright (c) Kisio. All rights reserved.
//

import Foundation
import ObjectMapper

public struct StopArea: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let label = "label"
    static let name = "name"
    static let id = "id"
    static let coord = "coord"
    static let timezone = "timezone"
    static let links = "links"
    static let administrativeRegions = "administrative_regions"
    static let codes = "codes"
  }

  // MARK: Properties
  public var label: String?
  public var name: String?
  public var id: String?
  public var coord: Coord?
  public var timezone: String?
  public var links: [Any]?
  public var administrativeRegions: [AdministrativeRegions]?
  public var codes: [Codes]?

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
    label <- map[SerializationKeys.label]
    name <- map[SerializationKeys.name]
    id <- map[SerializationKeys.id]
    coord <- map[SerializationKeys.coord]
    timezone <- map[SerializationKeys.timezone]
    links <- map[SerializationKeys.links]
    administrativeRegions <- map[SerializationKeys.administrativeRegions]
    codes <- map[SerializationKeys.codes]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = label { dictionary[SerializationKeys.label] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = coord { dictionary[SerializationKeys.coord] = value.dictionaryRepresentation() }
    if let value = timezone { dictionary[SerializationKeys.timezone] = value }
    if let value = links { dictionary[SerializationKeys.links] = value }
    if let value = administrativeRegions { dictionary[SerializationKeys.administrativeRegions] = value.map { $0.dictionaryRepresentation() } }
    if let value = codes { dictionary[SerializationKeys.codes] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

}
