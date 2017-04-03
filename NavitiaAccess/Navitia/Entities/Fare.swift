//
//  Fare.swift
//
//  Created by Johan Rouve on 29/03/2017
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public struct Fare: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let total = "total"
    static let found = "found"
    static let links = "links"
  }

  // MARK: Properties
  public var total: Total?
  public var found: Bool? = false
  public var links: [Any]?

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
    total <- map[SerializationKeys.total]
    found <- map[SerializationKeys.found]
    links <- map[SerializationKeys.links]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = total { dictionary[SerializationKeys.total] = value.dictionaryRepresentation() }
    dictionary[SerializationKeys.found] = found
    if let value = links { dictionary[SerializationKeys.links] = value }
    return dictionary
  }

}
