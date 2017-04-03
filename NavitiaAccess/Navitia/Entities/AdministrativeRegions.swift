//
//  AdministrativeRegions.swift
//
//  Created by Johan Rouve on 23/03/2017
//  Copyright (c) Kisio. All rights reserved.
//

import Foundation
import ObjectMapper

public struct AdministrativeRegions: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let label = "label"
    static let name = "name"
    static let id = "id"
    static let coord = "coord"
    static let insee = "insee"
    static let zipCode = "zip_code"
    static let level = "level"
  }

  // MARK: Properties
  public var label: String?
  public var name: String?
  public var id: String?
  public var coord: Coord?
  public var insee: String?
  public var zipCode: String?
  public var level: Int?

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
    insee <- map[SerializationKeys.insee]
    zipCode <- map[SerializationKeys.zipCode]
    level <- map[SerializationKeys.level]
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
    if let value = insee { dictionary[SerializationKeys.insee] = value }
    if let value = zipCode { dictionary[SerializationKeys.zipCode] = value }
    if let value = level { dictionary[SerializationKeys.level] = value }
    return dictionary
  }

}
