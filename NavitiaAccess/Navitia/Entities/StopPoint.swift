//
//  StopPoint.swift
//
//  Created by Johan Rouve on 23/03/2017
//  Copyright (c) Kisio. All rights reserved.
//

import Foundation
import ObjectMapper

public struct StopPoint: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let label = "label"
    static let name = "name"
    static let physicalModes = "physical_modes"
    static let coord = "coord"
    static let id = "id"
    static let commercialModes = "commercial_modes"
    static let links = "links"
    static let equipments = "equipments"
    static let administrativeRegions = "administrative_regions"
    static let codes = "codes"
    static let stopArea = "stop_area"
  }

  // MARK: Properties
  public var label: String?
  public var name: String?
  public var physicalModes: [PhysicalModes]?
  public var coord: Coord?
  public var id: String?
  public var commercialModes: [CommercialModes]?
  public var links: [Any]?
  public var equipments: [Any]?
  public var administrativeRegions: [AdministrativeRegions]?
  public var codes: [Codes]?
  public var stopArea: StopArea?

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
    physicalModes <- map[SerializationKeys.physicalModes]
    coord <- map[SerializationKeys.coord]
    id <- map[SerializationKeys.id]
    commercialModes <- map[SerializationKeys.commercialModes]
    links <- map[SerializationKeys.links]
    equipments <- map[SerializationKeys.equipments]
    administrativeRegions <- map[SerializationKeys.administrativeRegions]
    codes <- map[SerializationKeys.codes]
    stopArea <- map[SerializationKeys.stopArea]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = label { dictionary[SerializationKeys.label] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = physicalModes { dictionary[SerializationKeys.physicalModes] = value.map { $0.dictionaryRepresentation() } }
    if let value = coord { dictionary[SerializationKeys.coord] = value.dictionaryRepresentation() }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = commercialModes { dictionary[SerializationKeys.commercialModes] = value.map { $0.dictionaryRepresentation() } }
    if let value = links { dictionary[SerializationKeys.links] = value }
    if let value = equipments { dictionary[SerializationKeys.equipments] = value }
    if let value = administrativeRegions { dictionary[SerializationKeys.administrativeRegions] = value.map { $0.dictionaryRepresentation() } }
    if let value = codes { dictionary[SerializationKeys.codes] = value.map { $0.dictionaryRepresentation() } }
    if let value = stopArea { dictionary[SerializationKeys.stopArea] = value.dictionaryRepresentation() }
    return dictionary
  }

}
