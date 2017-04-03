//
//  Links.swift
//
//  Created by Johan Rouve on 23/03/2017
//  Copyright (c) Kisio. All rights reserved.
//

import Foundation
import ObjectMapper

public struct Links: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let href = "href"
    static let type = "type"
    static let id = "id"
    static let rel = "rel"
    static let templated = "templated"
  }

  // MARK: Properties
  public var href: String?
  public var type: String?
  public var id: String?
  public var rel: String?
  public var templated: Bool? = false

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
    href <- map[SerializationKeys.href]
    type <- map[SerializationKeys.type]
    id <- map[SerializationKeys.id]
    rel <- map[SerializationKeys.rel]
    templated <- map[SerializationKeys.templated]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = href { dictionary[SerializationKeys.href] = value }
    if let value = type { dictionary[SerializationKeys.type] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = rel { dictionary[SerializationKeys.rel] = value }
    dictionary[SerializationKeys.templated] = templated
    return dictionary
  }

}
