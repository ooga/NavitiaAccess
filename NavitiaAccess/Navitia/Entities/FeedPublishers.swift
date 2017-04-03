//
//  FeedPublishers.swift
//
//  Created by Johan Rouve on 23/03/2017
//  Copyright (c) Kisio. All rights reserved.
//

import Foundation
import ObjectMapper

public struct FeedPublishers: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let license = "license"
    static let name = "name"
    static let id = "id"
    static let url = "url"
  }

  // MARK: Properties
  public var license: String?
  public var name: String?
  public var id: String?
  public var url: String?

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
    license <- map[SerializationKeys.license]
    name <- map[SerializationKeys.name]
    id <- map[SerializationKeys.id]
    url <- map[SerializationKeys.url]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = license { dictionary[SerializationKeys.license] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = url { dictionary[SerializationKeys.url] = value }
    return dictionary
  }

}
