//
//  To.swift
//
//  Created by Johan Rouve on 29/03/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct To: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let name = "name"
    static let quality = "quality"
    static let administrativeRegion = "administrative_region"
    static let id = "id"
    static let embeddedType = "embedded_type"
    static let stopPoint = "stop_point"
  }

  // MARK: Properties
  public var name: String?
  public var quality: Int?
  public var administrativeRegion: AdministrativeRegion?
  public var id: String?
  public var embeddedType: String?
  public var stopPoint: StopPoint?

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
    administrativeRegion <- map[SerializationKeys.administrativeRegion]
    id <- map[SerializationKeys.id]
    embeddedType <- map[SerializationKeys.embeddedType]
    stopPoint <- map[SerializationKeys.stopPoint]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = quality { dictionary[SerializationKeys.quality] = value }
    if let value = administrativeRegion { dictionary[SerializationKeys.administrativeRegion] = value.dictionaryRepresentation() }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = embeddedType { dictionary[SerializationKeys.embeddedType] = value }
    if let value = stopPoint { dictionary[SerializationKeys.stopPoint] = value.dictionaryRepresentation() }
    return dictionary
  }

}
