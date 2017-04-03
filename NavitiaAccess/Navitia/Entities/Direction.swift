//
//  Direction.swift
//
//  Created by Johan Rouve on 23/03/2017
//  Copyright (c) Kisio. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Direction: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let name = "name"
    static let quality = "quality"
    static let embeddedType = "embedded_type"
    static let id = "id"
    static let stopArea = "stop_area"
  }

  // MARK: Properties
  public var name: String?
  public var quality: Int?
  public var embeddedType: String?
  public var id: String?
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
    name <- map[SerializationKeys.name]
    quality <- map[SerializationKeys.quality]
    embeddedType <- map[SerializationKeys.embeddedType]
    id <- map[SerializationKeys.id]
    stopArea <- map[SerializationKeys.stopArea]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = quality { dictionary[SerializationKeys.quality] = value }
    if let value = embeddedType { dictionary[SerializationKeys.embeddedType] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = stopArea { dictionary[SerializationKeys.stopArea] = value.dictionaryRepresentation() }
    return dictionary
  }

}
