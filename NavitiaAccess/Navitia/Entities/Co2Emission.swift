//
//  Co2Emission.swift
//
//  Created by Johan Rouve on 29/03/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct Co2Emission: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let unit = "unit"
    static let value = "value"
  }

  // MARK: Properties
  public var unit: String?
  public var value: Float?

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
    unit <- map[SerializationKeys.unit]
    value <- map[SerializationKeys.value]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = unit { dictionary[SerializationKeys.unit] = value }
    if let value = value { dictionary[SerializationKeys.value] = value }
    return dictionary
  }

}
