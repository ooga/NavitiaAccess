//
//  Route.swift
//
//  Created by Johan Rouve on 23/03/2017
//  Copyright (c) Kisio. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Route: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let codes = "codes"
    static let name = "name"
    static let isFrequence = "is_frequence"
    static let line = "line"
    static let physicalModes = "physical_modes"
    static let id = "id"
    static let links = "links"
    static let directionType = "direction_type"
    static let geojson = "geojson"
    static let direction = "direction"
  }

  // MARK: Properties
  public var codes: [Codes]?
  public var name: String?
  public var isFrequence: String?
  public var line: Line?
  public var physicalModes: [PhysicalModes]?
  public var id: String?
  public var links: [Any]?
  public var directionType: String?
  public var geojson: Geojson?
  public var direction: Direction?

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
    codes <- map[SerializationKeys.codes]
    name <- map[SerializationKeys.name]
    isFrequence <- map[SerializationKeys.isFrequence]
    line <- map[SerializationKeys.line]
    physicalModes <- map[SerializationKeys.physicalModes]
    id <- map[SerializationKeys.id]
    links <- map[SerializationKeys.links]
    directionType <- map[SerializationKeys.directionType]
    geojson <- map[SerializationKeys.geojson]
    direction <- map[SerializationKeys.direction]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = codes { dictionary[SerializationKeys.codes] = value.map { $0.dictionaryRepresentation() } }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = isFrequence { dictionary[SerializationKeys.isFrequence] = value }
    if let value = line { dictionary[SerializationKeys.line] = value.dictionaryRepresentation() }
    if let value = physicalModes { dictionary[SerializationKeys.physicalModes] = value.map { $0.dictionaryRepresentation() } }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = links { dictionary[SerializationKeys.links] = value }
    if let value = directionType { dictionary[SerializationKeys.directionType] = value }
    if let value = geojson { dictionary[SerializationKeys.geojson] = value.dictionaryRepresentation() }
    if let value = direction { dictionary[SerializationKeys.direction] = value.dictionaryRepresentation() }
    return dictionary
  }

}
