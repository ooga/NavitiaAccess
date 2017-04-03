//
//  Geojson.swift
//
//  Created by Johan Rouve on 23/03/2017
//  Copyright (c) Kisio. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Geojson: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let type = "type"
    static let coordinates = "coordinates"
    static let properties = "properties"
  }

  // MARK: Properties
  public var type: String?
  public var coordinates: [Coordinates]?
  public var properties: [Properties]?

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
    type <- map[SerializationKeys.type]
    coordinates <- map[SerializationKeys.coordinates]
    properties <- map[SerializationKeys.properties]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = type { dictionary[SerializationKeys.type] = value }
    if let value = coordinates { dictionary[SerializationKeys.coordinates] = value.map { $0.dictionaryRepresentation() } }
    if let value = properties { dictionary[SerializationKeys.properties] = value.map { $0.dictionaryRepresentation() } }
    return dictionary
  }

}
